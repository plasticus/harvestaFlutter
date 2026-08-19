import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/app_database.dart';
import '../game/turn_engine.dart';
import '../game/corp_provisioning_service.dart';
import '../models/turn_result.dart';
import 'database_provider.dart';

class GameState {
  final String corpName;
  final int gameTurn;
  final int solars;
  final bool isCommissioned;
  final String activeSquadron;
  final bool isLoading;

  const GameState({
    required this.corpName,
    required this.gameTurn,
    required this.solars,
    required this.isCommissioned,
    this.activeSquadron = 'Alpha Squadron',
    this.isLoading = false,
  });

  GameState copyWith({
    String? corpName,
    int? gameTurn,
    int? solars,
    bool? isCommissioned,
    String? activeSquadron,
    bool? isLoading,
  }) {
    return GameState(
      corpName: corpName ?? this.corpName,
      gameTurn: gameTurn ?? this.gameTurn,
      solars: solars ?? this.solars,
      isCommissioned: isCommissioned ?? this.isCommissioned,
      activeSquadron: activeSquadron ?? this.activeSquadron,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class GameStateNotifier extends Notifier<GameState> {
  @override
  GameState build() {
    return const GameState(
      corpName: '',
      gameTurn: 1,
      solars: 0,
      isCommissioned: false,
      isLoading: true,
    );
  }

  AppDatabase get _db => ref.read(databaseProvider);

  /// Load initial state or active corporation
  Future<void> initialize() async {
    state = state.copyWith(isLoading: true);
    final turn = await _db.gameDataDao.getTurn();

    // Find any existing non-AI corp
    final allCorps = await _db.corpDao.getAllCorps();
    final playerCorps = allCorps.where((c) => !c.isAi).toList();

    if (playerCorps.isNotEmpty) {
      final active = playerCorps.first;
      final solars = await _db.inventoryDao.getItemQuantity(active.username, 'Solars');

      state = GameState(
        corpName: active.username,
        gameTurn: turn,
        solars: solars,
        isCommissioned: true,
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        gameTurn: turn,
        isCommissioned: false,
        isLoading: false,
      );
    }
  }

  /// Commission a new corporation
  Future<void> commissionNewCorp({
    required String corpName,
    String? stationName,
    String heritage = 'Earth',
    int startingSolars = 250000,
  }) async {
    state = state.copyWith(isLoading: true);
    final provisioningService = CorpProvisioningService(_db);

    await provisioningService.provisionNewGame(
      corpName: corpName,
      stationName: stationName,
      heritage: heritage,
      startingSolars: startingSolars,
    );

    final turn = await _db.gameDataDao.getTurn();
    final solars = await _db.inventoryDao.getItemQuantity(corpName, 'Solars');

    state = GameState(
      corpName: corpName,
      gameTurn: turn,
      solars: solars,
      isCommissioned: true,
      isLoading: false,
    );
  }

  /// Advance turn across the game universe
  Future<TurnResult> advanceTurn() async {
    if (state.corpName.isEmpty) {
      throw StateError('Cannot advance turn without an active corporation.');
    }

    state = state.copyWith(isLoading: true);
    final turnEngine = TurnEngine(_db);
    final result = await turnEngine.advanceTurn(state.corpName);

    final updatedSolars = await _db.inventoryDao.getItemQuantity(state.corpName, 'Solars');

    state = state.copyWith(
      gameTurn: result.newTurn,
      solars: updatedSolars,
      isLoading: false,
    );

    return result;
  }

  /// Refresh Solars balance
  Future<void> refreshSolars() async {
    if (state.corpName.isNotEmpty) {
      final solars = await _db.inventoryDao.getItemQuantity(state.corpName, 'Solars');
      state = state.copyWith(solars: solars);
    }
  }
}

final gameStateProvider = NotifierProvider<GameStateNotifier, GameState>(() {
  return GameStateNotifier();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../data/app_database.dart';
import 'database_provider.dart';

class TurnActionsState {
  final bool scanDone;
  final bool mineDone;
  final bool researchDone;
  final bool cadetsDone;
  final bool expeditionDone;
  final bool marketDone;

  const TurnActionsState({
    this.scanDone = false,
    this.mineDone = false,
    this.researchDone = false,
    this.cadetsDone = false,
    this.expeditionDone = false,
    this.marketDone = false,
  });

  TurnActionsState copyWith({
    bool? scanDone,
    bool? mineDone,
    bool? researchDone,
    bool? cadetsDone,
    bool? expeditionDone,
    bool? marketDone,
  }) {
    return TurnActionsState(
      scanDone: scanDone ?? this.scanDone,
      mineDone: mineDone ?? this.mineDone,
      researchDone: researchDone ?? this.researchDone,
      cadetsDone: cadetsDone ?? this.cadetsDone,
      expeditionDone: expeditionDone ?? this.expeditionDone,
      marketDone: marketDone ?? this.marketDone,
    );
  }
}

class TurnActionsNotifier extends Notifier<TurnActionsState> {
  @override
  TurnActionsState build() {
    return const TurnActionsState();
  }

  AppDatabase get _db => ref.read(databaseProvider);

  /// Load actions state from DB for the specified corp & turn
  Future<void> loadTurnActions(String corpName, int turn) async {
    if (corpName.isEmpty) return;

    final entry = await _db.ledgerDao.getTurnActions(corpName, turn);
    if (entry != null) {
      state = TurnActionsState(
        scanDone: entry.scanDone,
        mineDone: entry.mineDone,
        researchDone: entry.researchDone,
        cadetsDone: entry.cadetsDone,
        expeditionDone: entry.expeditionDone,
        marketDone: entry.marketDone,
      );
    } else {
      state = const TurnActionsState();
    }
  }

  /// Mark an action as completed for the current turn
  Future<void> markActionDone(String corpName, int turn, String actionType) async {
    if (corpName.isEmpty) return;

    var newState = state;
    switch (actionType.toLowerCase()) {
      case 'scan':
        newState = state.copyWith(scanDone: true);
        break;
      case 'mine':
        newState = state.copyWith(mineDone: true);
        break;
      case 'research':
        newState = state.copyWith(researchDone: true);
        break;
      case 'cadets':
        newState = state.copyWith(cadetsDone: true);
        break;
      case 'expedition':
        newState = state.copyWith(expeditionDone: true);
        break;
      case 'market':
        newState = state.copyWith(marketDone: true);
        break;
    }

    state = newState;

    await _db.ledgerDao.recordTurnAction(
      corpName,
      turn,
      CorpTurnActionsCompanion.insert(
        corpName: corpName,
        gameTurn: turn,
        scanDone: Value(newState.scanDone),
        mineDone: Value(newState.mineDone),
        researchDone: Value(newState.researchDone),
        cadetsDone: Value(newState.cadetsDone),
        expeditionDone: Value(newState.expeditionDone),
        marketDone: Value(newState.marketDone),
      ),
    );
  }

  /// Reset all action locks when advancing to a new turn
  void resetForNewTurn() {
    state = const TurnActionsState();
  }
}

final turnActionsProvider = NotifierProvider<TurnActionsNotifier, TurnActionsState>(() {
  return TurnActionsNotifier();
});

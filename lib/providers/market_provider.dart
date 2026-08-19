import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/app_database.dart';
import '../game/economy/market_price_service.dart';
import '../game/economy/ledger_service.dart';
import 'database_provider.dart';
import 'game_state_provider.dart';
import 'turn_actions_provider.dart';

class MarketState {
  final List<CommodityPriceInfo> prices;
  final Map<String, int> stockpiles;
  final int solars;
  final int tradeLevel;
  final double tradeBonusPct;
  final bool isLoading;
  final String? errorMessage;

  const MarketState({
    required this.prices,
    required this.stockpiles,
    required this.solars,
    required this.tradeLevel,
    required this.tradeBonusPct,
    this.isLoading = false,
    this.errorMessage,
  });

  MarketState copyWith({
    List<CommodityPriceInfo>? prices,
    Map<String, int>? stockpiles,
    int? solars,
    int? tradeLevel,
    double? tradeBonusPct,
    bool? isLoading,
    String? errorMessage,
  }) {
    return MarketState(
      prices: prices ?? this.prices,
      stockpiles: stockpiles ?? this.stockpiles,
      solars: solars ?? this.solars,
      tradeLevel: tradeLevel ?? this.tradeLevel,
      tradeBonusPct: tradeBonusPct ?? this.tradeBonusPct,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class MarketNotifier extends Notifier<MarketState> {
  @override
  MarketState build() {
    return const MarketState(
      prices: [],
      stockpiles: {},
      solars: 0,
      tradeLevel: 0,
      tradeBonusPct: 0.0,
      isLoading: true,
    );
  }

  AppDatabase get _db => ref.read(databaseProvider);

  /// Loads live market pricing and inventory stockpiles
  Future<void> loadMarket() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    // 1. Fetch research trade bonus
    final researchItem = await _db.researchDao.getResearchItem(gameState.corpName, 'tradeRelationships');
    final tradeLevel = researchItem?.level ?? 0;
    final tradeBonusPct = min(0.20, tradeLevel * 0.03);

    // 2. Compute deterministic prices for the current turn
    final prices = MarketPriceService.getAllPrices(
      turn: gameState.gameTurn,
      tradeRelationshipsLevel: tradeLevel,
    );

    // 3. Fetch Corp Stockpiles
    final inventory = await _db.inventoryDao.getCorpInventory(gameState.corpName);
    final stockpiles = <String, int>{};
    for (final it in inventory) {
      stockpiles[it.item] = it.qty;
    }

    final solars = stockpiles['Solars'] ?? 0;

    state = MarketState(
      prices: prices,
      stockpiles: stockpiles,
      solars: solars,
      tradeLevel: tradeLevel,
      tradeBonusPct: tradeBonusPct,
      isLoading: false,
    );
  }

  /// Sells a commodity from corp stockpile to the exchange
  Future<bool> sellCommodity({required String item, required int qty}) async {
    if (qty <= 0) return false;
    final gameState = ref.read(gameStateProvider);
    final currentStock = state.stockpiles[item] ?? 0;

    if (currentStock < qty) {
      state = state.copyWith(errorMessage: 'Insufficient stock. You have $currentStock m³.');
      return false;
    }

    final priceInfo = state.prices.firstWhere((p) => p.name == item);
    final totalProceeds = qty * priceInfo.sellPrice;

    // Deduct commodity & credit Solars
    await _db.inventoryDao.adjustItemQuantity(gameState.corpName, item, -qty);
    await _db.inventoryDao.adjustItemQuantity(gameState.corpName, 'Solars', totalProceeds);

    // Record in ledger
    final ledgerService = LedgerService(_db);
    await ledgerService.recordRevenue(
      corpName: gameState.corpName,
      turn: gameState.gameTurn,
      amount: totalProceeds,
      category: 'market',
      description: 'Sold $qty m³ $item @ ⁂${priceInfo.sellPrice}/m³',
    );

    // Mark market action completed
    await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'market');
    await ref.read(gameStateProvider.notifier).refreshSolars();

    await loadMarket();
    return true;
  }

  /// Buys a commodity from the exchange into corp stockpile
  Future<bool> buyCommodity({required String item, required int qty}) async {
    if (qty <= 0) return false;
    final gameState = ref.read(gameStateProvider);
    final priceInfo = state.prices.firstWhere((p) => p.name == item);
    final totalCost = qty * priceInfo.buyPrice;

    if (state.solars < totalCost) {
      state = state.copyWith(errorMessage: 'Insufficient Solars. Required: ⁂$totalCost.');
      return false;
    }

    // Deduct Solars & credit commodity
    await _db.inventoryDao.adjustItemQuantity(gameState.corpName, 'Solars', -totalCost);
    await _db.inventoryDao.adjustItemQuantity(gameState.corpName, item, qty);

    // Record in ledger
    final ledgerService = LedgerService(_db);
    await ledgerService.recordExpense(
      corpName: gameState.corpName,
      turn: gameState.gameTurn,
      amount: totalCost,
      category: 'market',
      description: 'Purchased $qty m³ $item @ ⁂${priceInfo.buyPrice}/m³,',
    );

    // Mark market action completed
    await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'market');
    await ref.read(gameStateProvider.notifier).refreshSolars();

    await loadMarket();
    return true;
  }
}

final marketProvider = NotifierProvider<MarketNotifier, MarketState>(() {
  return MarketNotifier();
});

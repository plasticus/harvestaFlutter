import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/economy/market_price_service.dart';
import 'package:harvesta/game/economy/ledger_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;

  const testCorp = 'Ceres Prospecting LLC';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Ceres',
      startingSolars: 250000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 3 Market & Commodity Pricing Verification', () {
    test('MarketPriceService generates deterministic pricing across turns', () {
      final t1PricesA = MarketPriceService.getAllPrices(turn: 1);
      final t1PricesB = MarketPriceService.getAllPrices(turn: 1);
      final t2Prices = MarketPriceService.getAllPrices(turn: 2);

      // Must be 7 commodities
      expect(t1PricesA.length, equals(7));

      // Same turn must produce identical prices
      for (var i = 0; i < 7; i++) {
        expect(t1PricesA[i].name, equals(t1PricesB[i].name));
        expect(t1PricesA[i].buyPrice, equals(t1PricesB[i].buyPrice));
        expect(t1PricesA[i].sellPrice, equals(t1PricesB[i].sellPrice));
        expect(t1PricesA[i].variancePct, inInclusiveRange(-0.10, 0.10));
      }

      // Turn 2 prices are deterministic and valid
      expect(t2Prices.length, equals(7));
      for (final p in t2Prices) {
        expect(p.buyPrice, greaterThan(p.sellPrice));
      }
    });

    test('Trade Relationships research improves buy discounts and sell premiums', () {
      final basePriceInfo = MarketPriceService.getPrice(
        commodity: 'Conductive Metals',
        turn: 5,
        tradeRelationshipsLevel: 0,
      );

      final leveledPriceInfo = MarketPriceService.getPrice(
        commodity: 'Conductive Metals',
        turn: 5,
        tradeRelationshipsLevel: 5, // 15% discount/premium
      );

      // Leveled trade gives cheaper buy price
      expect(leveledPriceInfo.buyPrice, lessThan(basePriceInfo.buyPrice));

      // Leveled trade gives higher sell price
      expect(leveledPriceInfo.sellPrice, greaterThan(basePriceInfo.sellPrice));
    });

    test('Executing commodity sale credits Solars, debits stock, and records in ledger', () async {
      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      final initialMetals = await db.inventoryDao.getItemQuantity(testCorp, 'Conductive Metals');
      expect(initialMetals, equals(100));

      final priceInfo = MarketPriceService.getPrice(
        commodity: 'Conductive Metals',
        turn: 1,
        tradeRelationshipsLevel: 0,
      );

      const sellQty = 40;
      final expectedProceeds = sellQty * priceInfo.sellPrice;

      // Execute sale
      await db.inventoryDao.adjustItemQuantity(testCorp, 'Conductive Metals', -sellQty);
      await db.inventoryDao.adjustItemQuantity(testCorp, 'Solars', expectedProceeds);

      final ledgerService = LedgerService(db);
      await ledgerService.recordRevenue(
        corpName: testCorp,
        turn: 1,
        amount: expectedProceeds,
        category: 'market',
        description: 'Sold $sellQty m³ Conductive Metals',
      );

      final newSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      final newMetals = await db.inventoryDao.getItemQuantity(testCorp, 'Conductive Metals');

      expect(newSolars, equals(initialSolars + expectedProceeds));
      expect(newMetals, equals(60));

      final ledger = await db.ledgerDao.getLedgerHistory(testCorp);
      expect(ledger.last.revenue, equals(expectedProceeds));
    });

    test('Executing commodity purchase debits Solars, credits stock, and records in ledger', () async {
      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      final initialGases = await db.inventoryDao.getItemQuantity(testCorp, 'Fuel Gases');

      final priceInfo = MarketPriceService.getPrice(
        commodity: 'Fuel Gases',
        turn: 1,
        tradeRelationshipsLevel: 0,
      );

      const buyQty = 50;
      final expectedCost = buyQty * priceInfo.buyPrice;

      // Execute purchase
      await db.inventoryDao.adjustItemQuantity(testCorp, 'Solars', -expectedCost);
      await db.inventoryDao.adjustItemQuantity(testCorp, 'Fuel Gases', buyQty);

      final ledgerService = LedgerService(db);
      await ledgerService.recordExpense(
        corpName: testCorp,
        turn: 1,
        amount: expectedCost,
        category: 'market',
        description: 'Purchased $buyQty m³ Fuel Gases',
      );

      final newSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      final newGases = await db.inventoryDao.getItemQuantity(testCorp, 'Fuel Gases');

      expect(newSolars, equals(initialSolars - expectedCost));
      expect(newGases, equals(initialGases + buyQty));

      final ledger = await db.ledgerDao.getLedgerHistory(testCorp);
      expect(ledger.last.expenses, equals(expectedCost));
    });
  });
}

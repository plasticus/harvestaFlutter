import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/turn_engine.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late TurnEngine turnEngine;

  const testCorp = 'Hyperion Extraction';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    turnEngine = TurnEngine(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 2 Turn Engine Verification', () {
    test('Advance turn increments game turn, creates missions, replenishes cadets, and logs ledger', () async {
      final initialTurn = await db.gameDataDao.getTurn();
      expect(initialTurn, equals(1));

      // Advance to Turn 2
      final result = await turnEngine.advanceTurn(testCorp);

      expect(result.previousTurn, equals(1));
      expect(result.newTurn, equals(2));
      expect(result.logs.length, greaterThanOrEqualTo(4));

      // 1. Verify DB turn state
      final currentTurn = await db.gameDataDao.getTurn();
      expect(currentTurn, equals(2));

      // 2. Verify Missions generated for Turn 2
      final missions = await db.missionDao.getMissionsForTurn(testCorp, 2);
      expect(missions.length, equals(5));
      for (final m in missions) {
        expect(m.distance, inInclusiveRange(0.20, 6.00));
        expect(m.payout, greaterThan(150000));
        expect(m.textContent, isNotEmpty);
      }

      // 3. Verify Cadet Academy candidate pool (maintained at 20)
      final cadets = await db.crewDao.getAvailableCadets();
      expect(cadets.length, equals(20));

      // 4. Verify Turn Actions lockout reset
      final actions = await db.ledgerDao.getTurnActions(testCorp, 2);
      expect(actions, isNotNull);
      expect(actions?.scanDone, isFalse);
      expect(actions?.mineDone, isFalse);
      expect(actions?.researchDone, isFalse);

      // 5. Verify Financial Ledger recorded snapshot for Turn 2
      final ledger = await db.ledgerDao.getLedgerHistory(testCorp);
      expect(ledger.length, equals(2)); // Turn 1 baseline + Turn 2 snapshot
      expect(ledger.last.gameTurn, equals(2));
      expect(ledger.last.netWorth, greaterThan(250000));
    });

    test('Advancing multiple turns preserves turn history in ledger', () async {
      await turnEngine.advanceTurn(testCorp); // Turn 2
      await turnEngine.advanceTurn(testCorp); // Turn 3
      await turnEngine.advanceTurn(testCorp); // Turn 4

      final currentTurn = await db.gameDataDao.getTurn();
      expect(currentTurn, equals(4));

      final ledger = await db.ledgerDao.getLedgerHistory(testCorp);
      expect(ledger.length, equals(4)); // Turns 1, 2, 3, 4
      expect(ledger.map((l) => l.gameTurn).toList(), equals([1, 2, 3, 4]));
    });
  });
}

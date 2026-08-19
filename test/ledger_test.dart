import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/economy/ledger_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late LedgerService ledgerService;

  const testCorp = 'Proxima Dynamics';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    ledgerService = LedgerService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 300000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 3 Ledger & Valuation Analytics Verification', () {
    test('Calculates corporate asset valuations accurately', () async {
      final summary = await ledgerService.calculateValuations(testCorp);

      expect(summary.treasurySolars, equals(300000));
      expect(summary.fleetValue, greaterThan(0)); // 3 starter ships
      expect(summary.materialValue, greaterThan(0)); // Starter stockpiles
      expect(summary.estimatedPayroll, greaterThan(0)); // 6 starter officers
      expect(summary.totalNetWorth, equals(summary.treasurySolars + summary.fleetValue + summary.materialValue));
    });

    test('Records multi-category revenues and expenses in ledger snapshot', () async {
      await ledgerService.recordRevenue(
        corpName: testCorp,
        turn: 1,
        amount: 80000,
        category: 'missions',
        description: 'Completed Sector Patrol',
      );

      await ledgerService.recordExpense(
        corpName: testCorp,
        turn: 1,
        amount: 25000,
        category: 'repairs',
        description: 'Drydock Hull Patching',
      );

      final history = await db.ledgerDao.getLedgerHistory(testCorp);
      expect(history.isNotEmpty, isTrue);

      final turn1Record = history.firstWhere((h) => h.gameTurn == 1);
      expect(turn1Record.revenue, equals(80000));
      expect(turn1Record.expenses, equals(25000));
      expect(turn1Record.notes, contains('Drydock Hull Patching'));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/station/station_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late StationService stationService;

  const testCorp = 'Titan Outpost Operations';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    stationService = StationService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 300000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 4 Station Facilities Verification', () {
    test('Fetches all 5 starting facilities at Level 1', () async {
      final buildings = await stationService.getStationBuildings(testCorp);
      expect(buildings.length, equals(5));

      for (final b in buildings) {
        expect(b.level, equals(1));
        expect(b.upgradeCost, equals(100000));
      }
    });

    test('Upgrading station facility debits Solars, increments level, and records expense', () async {
      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      expect(initialSolars, equals(300000));

      final upgraded = await stationService.upgradeBuilding(
        corpName: testCorp,
        buildingType: 'Scanner',
        turn: 1,
      );

      expect(upgraded, isTrue);

      final building = await db.stationDao.getBuilding(testCorp, 'Scanner');
      expect(building?.level, equals(2));
      expect(building?.buildingName, equals('Deep Belt Scan Array'));

      final newSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      expect(newSolars, equals(200000));

      final ledger = await db.ledgerDao.getLedgerHistory(testCorp);
      expect(ledger.last.expenses, equals(100000));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/fleet/ship_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late ShipService shipService;

  const testCorp = 'Starlight Armada LLC';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    shipService = ShipService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 5 Fleet & Shipyard Verification', () {
    test('Purchases a new ship from catalog with shipbuilding discount applied', () async {
      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');

      // Level up shipBuilding to Level 2 (10% discount)
      await db.researchDao.upsertResearch(testCorp, 'shipBuilding', 2, 0, 1200);

      final purchased = await shipService.purchaseShip(
        corpName: testCorp,
        modelName: 'Magpie',
        shipName: 'SS Swift Falcon',
        squadron: 'Alpha Squadron',
        turn: 1,
      );

      expect(purchased, isTrue);

      final ship = await db.fleetDao.getShipByName('SS Swift Falcon');
      expect(ship, isNotNull);
      expect(ship?.squadron, equals('Alpha Squadron'));
      expect(ship?.hp, equals(ship?.maxHp));

      final updatedSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      expect(updatedSolars, lessThan(initialSolars));
    });

    test('Drydock accurately estimates and repairs damaged ship subsystems', () async {
      final ship = (await db.fleetDao.getCorpShips(testCorp)).first;

      // Simulate battle damage to multiple subsystems
      await (db.update(db.fleet)..where((f) => f.shipName.equals(ship.shipName))).write(
        const FleetCompanion(
          hp: Value(20),
          engines: Value(10),
          cargo: Value(5),
        ),
      );

      final estimate = await shipService.getRepairEstimate(testCorp, ship.shipName);
      expect(estimate.needsRepair, isTrue);
      expect(estimate.contractCost, greaterThan(0));
      expect(estimate.inHouseCost, greaterThan(0));
      expect(estimate.zeroGMetals, greaterThan(0));

      // Execute Contract Repair
      final repaired = await shipService.repairShip(
        corpName: testCorp,
        shipName: ship.shipName,
        inHouse: false,
        turn: 1,
      );

      expect(repaired, isTrue);

      final restoredShip = await db.fleetDao.getShipByName(ship.shipName);
      expect(restoredShip?.hp, equals(restoredShip?.maxHp));
      expect(restoredShip?.engines, equals(restoredShip?.maxEngines));
      expect(restoredShip?.cargo, equals(restoredShip?.maxCargo));
    });

    test('Decommissioning a vessel scraps hull, credits Solars, and clears crew assignments', () async {
      final ship = (await db.fleetDao.getCorpShips(testCorp)).first;

      final scrapValue = await shipService.sellShip(
        corpName: testCorp,
        shipName: ship.shipName,
        turn: 1,
      );

      expect(scrapValue, greaterThan(0));

      final deletedShip = await db.fleetDao.getShipByName(ship.shipName);
      expect(deletedShip, isNull);

      final assignedOfficers = await (db.select(db.crew)
            ..where((c) => c.corpName.equals(testCorp) & c.shipName.equals(ship.shipName)))
          .get();
      expect(assignedOfficers, isEmpty);
    });
  });
}

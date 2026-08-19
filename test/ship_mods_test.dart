import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/fleet/ship_mod_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late ShipModService modService;

  const testCorp = 'Frontier Tech Outfits';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    modService = ShipModService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 5 Ship Hardpoint Modules Verification', () {
    test('Calculates hardpoint limits and accounts for Ship Bay tech level', () async {
      final ship = (await db.fleetDao.getCorpShips(testCorp)).first;

      final hpInitial = await modService.getShipHardpoints(testCorp, ship.shipName);
      expect(hpInitial.weapMax, greaterThanOrEqualTo(0));
      expect(hpInitial.armorMax, greaterThanOrEqualTo(0));
      expect(hpInitial.bayMax, greaterThanOrEqualTo(0));

      // Level up shipBay to Level 3 (+1 bay slot)
      await db.researchDao.upsertResearch(testCorp, 'shipBay', 3, 0, 2400);

      final hpBoosted = await modService.getShipHardpoints(testCorp, ship.shipName);
      expect(hpBoosted.bayMax, equals(hpInitial.bayMax + 1));
    });

    test('Installs module, debits Solars, and recalculates ship market value', () async {
      final ship = (await db.fleetDao.getCorpShips(testCorp)).first;
      final initialVal = ship.value;

      final fitted = await modService.installModule(
        corpName: testCorp,
        shipName: ship.shipName,
        modName: 'Ablative Armor',
        turn: 1,
      );

      expect(fitted, isTrue);

      final hp = await modService.getShipHardpoints(testCorp, ship.shipName);
      expect(hp.installedMods.length, equals(1));
      expect(hp.installedMods.first.modName, equals('Ablative Armor'));

      final updatedShip = await db.fleetDao.getShipByName(ship.shipName);
      expect(updatedShip?.value, greaterThan(initialVal));

      // Uninstall and scrap
      final refund = await modService.uninstallModule(
        corpName: testCorp,
        shipName: ship.shipName,
        modId: hp.installedMods.first.modId,
        turn: 1,
      );

      expect(refund, greaterThan(0));

      final finalHp = await modService.getShipHardpoints(testCorp, ship.shipName);
      expect(finalHp.installedMods, isEmpty);
    });
  });
}

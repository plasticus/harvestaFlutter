import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/fleet/crew_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late CrewService crewService;

  const testCorp = 'Orion Personnel Corp';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    crewService = CrewService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 5 Crew & Cadet Academy Verification', () {
    test('Assigns bridge crew roles to a vessel and synchronizes squadron', () async {
      final ship = (await db.fleetDao.getCorpShips(testCorp)).first;
      final officers = await db.crewDao.getCorpCrew(testCorp);

      expect(officers.length, greaterThanOrEqualTo(2));

      await crewService.assignBridgeCrew(
        corpName: testCorp,
        shipName: ship.shipName,
        captainId: officers[0].id,
        pilotId: officers[1].id,
      );

      final captain = await (db.select(db.crew)..where((c) => c.id.equals(officers[0].id))).getSingle();
      expect(captain.shipName, equals(ship.shipName));
      expect(captain.assignment, equals('Captain'));
      expect(captain.squadron, equals(ship.squadron));

      final pilot = await (db.select(db.crew)..where((c) => c.id.equals(officers[1].id))).getSingle();
      expect(pilot.shipName, equals(ship.shipName));
      expect(pilot.assignment, equals('Pilot'));
    });

    test('Hires candidate cadet, deducts Solars, and adds to active crew roster', () async {
      // Seed sample cadet candidate into cadets table
      final cadetId = await db.into(db.cadets).insert(
            const CadetsCompanion(
              corpName: Value('Available'),
              name: Value('Cadet John Archer'),
              status: Value('Active'),
              leadership: Value(45),
              influence: Value(30),
              pilot: Value(55),
              computation: Value(60),
              repair: Value(40),
              shipWeapons: Value(50),
              firearms: Value(20),
              melee: Value(15),
              athletics: Value(50),
            ),
          );

      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');

      final hired = await crewService.hireCadet(
        corpName: testCorp,
        cadetId: cadetId,
        turn: 1,
      );

      expect(hired, isTrue);

      // Verify removed from cadets table
      final cadetCheck = await (db.select(db.cadets)..where((c) => c.id.equals(cadetId))).getSingleOrNull();
      expect(cadetCheck, isNull);

      // Verify added to crew table
      final newOfficer = await (db.select(db.crew)
            ..where((c) => c.corpName.equals(testCorp) & c.name.equals('Cadet John Archer')))
          .getSingleOrNull();
      expect(newOfficer, isNotNull);
      expect(newOfficer?.pilot, equals(55));
      expect(newOfficer?.fighting, equals(35));

      final newSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      expect(newSolars, lessThan(initialSolars));
    });

    test('Calculates corporate payroll accurately across all officers', () async {
      final payroll = await crewService.calculatePayroll(testCorp);
      expect(payroll, greaterThan(0));
    });
  });
}

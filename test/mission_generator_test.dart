import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/missions/mission_generator_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late MissionGeneratorService generatorService;

  const testCorp = 'Frontier Logistics Consortium';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    generatorService = MissionGeneratorService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 6 Mission Generator Verification', () {
    test('Generates exactly 5 mission contracts for the current turn', () async {
      final missions = await generatorService.generateMissions(testCorp, 1);
      expect(missions.length, equals(5));

      for (final m in missions) {
        expect(m.distance, greaterThanOrEqualTo(0.20));
        expect(m.distance, lessThanOrEqualTo(6.00));
        expect(m.cr, inInclusiveRange(1, 3));
        expect(m.payout, greaterThanOrEqualTo(180000));
        expect(m.fuelCost, greaterThan(0));
        expect(m.narrative, isNotEmpty);
      }

      // Querying again on the same turn returns the existing 5 contracts without duplication
      final cachedMissions = await generatorService.generateMissions(testCorp, 1);
      expect(cachedMissions.length, equals(5));
      expect(cachedMissions.first.id, equals(missions.first.id));
    });

    test('Astrogation research level applies up to 20% discount on fuel cost', () async {
      const distance = 4.0;
      final initialFuelCost = await generatorService.calculateFuelCost(testCorp, distance);

      // Level up astrogation to Level 3 (12% discount)
      await db.researchDao.upsertResearch(testCorp, 'astrogation', 3, 0, 2400);
      final discountedFuelCost = await generatorService.calculateFuelCost(testCorp, distance);

      expect(discountedFuelCost, lessThan(initialFuelCost));
    });
  });
}

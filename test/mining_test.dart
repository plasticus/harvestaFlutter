import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/station/scanning_service.dart';
import 'package:harvesta/game/station/mining_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late ScanningService scanningService;
  late MiningService miningService;

  const testCorp = 'Deep Core Extractions';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    scanningService = ScanningService(db);
    miningService = MiningService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Ceres', // Ceres grants asteroidMining Level 1
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 4 Mining & Extraction Verification', () {
    test('Calculates squadron hauling capacity accurately', () async {
      final capacity = await miningService.calculateSquadronCapacity(testCorp, 'Alpha Squadron');
      expect(capacity, greaterThan(0));
    });

    test('Executes asteroid extraction, applies refinery efficiency, and deposits yields', () async {
      final sweep = await scanningService.executeRadarSweep(testCorp, 1);
      expect(sweep.discoveredAsteroids, isNotEmpty);

      final target = sweep.discoveredAsteroids.first;

      final initialMetals = await db.inventoryDao.getItemQuantity(testCorp, 'Surface Construction Metals');

      final result = await miningService.executeMining(
        corpName: testCorp,
        squadron: 'Alpha Squadron',
        asteroidName: target.asteroidName,
      );

      // Ceres has Level 1 asteroidMining => 55% efficiency (45% loss)
      expect(result.efficiency, equals(0.55));
      expect(result.extractedM3, greaterThan(0));
      expect(result.totalYieldM3, greaterThan(0));

      final updatedMetals = await db.inventoryDao.getItemQuantity(testCorp, 'Surface Construction Metals');
      final expectedGain = result.yields['Surface Construction Metals'] ?? 0;
      expect(updatedMetals, equals(initialMetals + expectedGain));
    });
  });
}

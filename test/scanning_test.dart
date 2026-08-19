import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/station/scanning_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late ScanningService scanningService;

  const testCorp = 'Frontier Sensors Inc';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    scanningService = ScanningService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 4 Radar Scanning Verification', () {
    test('Radar sweep discovers candidate asteroids according to scan research level', () async {
      // At scan Level 0: 2 candidates, max 200 m3
      final result = await scanningService.executeRadarSweep(testCorp, 1);

      expect(result.discoveredAsteroids.length, equals(2));
      for (final a in result.discoveredAsteroids) {
        expect(a.m3, lessThanOrEqualTo(200));
      }

      // Check scanned records in DB
      final scanned = await db.asteroidDao.getScannedAsteroids(testCorp);
      expect(scanned.length, equals(2));
    });

    test('Higher scanning research discovers more and larger asteroids', () async {
      // Level up asteroidScanning to Level 2
      await db.researchDao.upsertResearch(testCorp, 'asteroidScanning', 2, 0, 1200);

      final result = await scanningService.executeRadarSweep(testCorp, 1);

      // Level 2 => 2 + 2 = 4 candidates, max 200 * (2 + 1) = 600 m3
      expect(result.discoveredAsteroids.length, equals(4));
      for (final a in result.discoveredAsteroids) {
        expect(a.m3, lessThanOrEqualTo(600));
      }
    });

    test('Subsequent sweeps do not re-discover already surveyed asteroids', () async {
      final sweep1 = await scanningService.executeRadarSweep(testCorp, 1);
      final sweep2 = await scanningService.executeRadarSweep(testCorp, 2);

      final names1 = sweep1.discoveredAsteroids.map((a) => a.asteroidName).toSet();
      final names2 = sweep2.discoveredAsteroids.map((a) => a.asteroidName).toSet();

      expect(names1.intersection(names2), isEmpty);

      final totalScanned = await db.asteroidDao.getScannedAsteroids(testCorp);
      expect(totalScanned.length, equals(names1.length + names2.length));
    });
  });
}

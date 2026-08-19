import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart' hide isNotNull;
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/station/research_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late ResearchService researchService;

  const testCorp = 'Apollo Science Labs';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    researchService = ResearchService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 4 R&D Laboratory Verification', () {
    test('Calculates daily RP output with assigned researchers and lab level', () async {
      // Reassign an officer to 'Research'
      final officers = await db.crewDao.getCorpCrew(testCorp);
      final firstOfficer = officers.first;

      await (db.update(db.crew)..where((c) => c.id.equals(firstOfficer.id)))
          .write(const CrewCompanion(assignment: Value('Research')));

      final rp = await researchService.calculateDailyRP(testCorp, 'asteroidScanning');
      expect(rp, greaterThanOrEqualTo(15));
    });

    test('Executing research cycle adds RP, advances progression, and recalibrates goal', () async {
      final initialItem = await db.researchDao.getResearchItem(testCorp, 'astrogation');
      final startProgress = initialItem?.progress ?? 0;
      final startLevel = initialItem?.level ?? 0;

      final result = await researchService.executeResearchCycle(
        corpName: testCorp,
        researchType: 'astrogation',
      );

      expect(result.rpGained, greaterThan(0));
      expect(result.techKey, equals('astrogation'));

      final updatedItem = await db.researchDao.getResearchItem(testCorp, 'astrogation');
      expect(updatedItem, isNotNull);

      if (!result.leveledUp) {
        expect(updatedItem?.progress, equals(startProgress + result.rpGained));
        expect(updatedItem?.level, equals(startLevel));
      } else {
        expect(updatedItem?.level, equals(startLevel + 1));
      }
    });
  });
}

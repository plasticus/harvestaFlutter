import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/advisor/gregg_advisor_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late GreggAdvisorService advisorService;

  const testCorp = 'Solaris Mining & Refinement';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    advisorService = GreggAdvisorService(db, customRng: Random(42));

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 10 Gregg Advisor AI Verification', () {
    test('Generates executive briefing containing prioritized recommendations and quips', () async {
      final briefing = await advisorService.generateExecutiveBriefing(
        corpName: testCorp,
        turn: 1,
      );

      expect(briefing, isNotEmpty);
      expect(briefing.any((a) => a.category == GreggCategory.general), isTrue);

      // Verify advice sorting (urgent -> recommended -> informational -> quip)
      for (var i = 0; i < briefing.length - 1; i++) {
        expect(briefing[i].priority.index, lessThanOrEqualTo(briefing[i + 1].priority.index));
      }
    });

    test('Triggers urgent financial warning when Solars are critically low', () async {
      // Drain Solars
      await db.inventoryDao.adjustItemQuantity(testCorp, 'Solars', -1450000); // 50k left

      final briefing = await advisorService.generateExecutiveBriefing(
        corpName: testCorp,
        turn: 1,
      );

      final urgentFin = briefing.where((a) => a.priority == GreggPriority.urgent && a.category == GreggCategory.financial).firstOrNull;
      expect(urgentFin, isNotNull);
      expect(urgentFin!.headline, contains('LIQUIDITY RESERVE DEFICIT'));
    });
  });
}

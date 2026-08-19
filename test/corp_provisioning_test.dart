import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 2 Corp Provisioning Verification', () {
    test('Provisions new corporation with starting assets and Earth heritage', () async {
      const corpName = 'Aegis Extraction Corp';
      await provisioningService.provisionNewGame(
        corpName: corpName,
        stationName: 'Aegis Station One',
        heritage: 'Earth',
        startingSolars: 250000,
      );

      // 1. Member entity
      final member = await db.corpDao.getCorpByName(corpName);
      expect(member, isNotNull);
      expect(member?.username, equals(corpName));
      expect(member?.isAi, isFalse);

      // 2. Inventory & Stockpiles
      final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
      expect(solars, equals(250000));

      final lifeSupp = await db.inventoryDao.getItemQuantity(corpName, 'Life Support Gases');
      expect(lifeSupp, equals(100));

      // 3. Station Buildings (5 buildings at level 1)
      final buildings = await db.stationDao.getBuildings(corpName);
      expect(buildings.length, equals(5));
      for (final b in buildings) {
        expect(b.level, equals(1));
        expect(b.stationName, equals('Aegis Station One'));
      }

      // 4. Research Trees (9 trees, Earth gives tradeRelationships L1)
      final research = await db.researchDao.getCorpResearch(corpName);
      expect(research.length, equals(9));

      final tradeRel = await db.researchDao.getResearchItem(corpName, 'tradeRelationships');
      expect(tradeRel?.level, equals(1));

      final mining = await db.researchDao.getResearchItem(corpName, 'asteroidMining');
      expect(mining?.level, equals(0));

      // 5. Starter Fleet (1 Freighter + 2 Corvettes)
      final fleet = await db.fleetDao.getCorpShips(corpName);
      expect(fleet.length, equals(3));

      final flagship = fleet.firstWhere((s) => s.shipName == '$corpName Pioneer');
      expect(flagship.squadron, equals('Alpha Squadron'));
      expect(flagship.hp, equals(flagship.maxHp));

      // 6. Starter Crew Officers (6 officers on flagship)
      final crew = await db.crewDao.getCorpCrew(corpName);
      expect(crew.length, equals(6));
      final captain = crew.firstWhere((c) => c.assignment == 'Captain');
      expect(captain.shipName, equals(flagship.shipName));

      // 7. Initial Ledger Record
      final ledger = await db.ledgerDao.getLedgerHistory(corpName);
      expect(ledger.length, equals(1));
      expect(ledger.first.solars, equals(250000));
      expect(ledger.first.netWorth, greaterThan(250000));
    });

    test('Provisions Mars heritage with combatTargeting L1', () async {
      const corpName = 'Martian Vanguard';
      await provisioningService.provisionNewGame(
        corpName: corpName,
        heritage: 'Mars',
        startingSolars: 500000,
      );

      final targeting = await db.researchDao.getResearchItem(corpName, 'combatTargeting');
      expect(targeting?.level, equals(1));

      final trade = await db.researchDao.getResearchItem(corpName, 'tradeRelationships');
      expect(trade?.level, equals(0));

      final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
      expect(solars, equals(500000));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 1 Database & Seed Verification', () {
    test('GameDataDao returns initial turn 1 and increments properly', () async {
      final turn = await db.gameDataDao.getTurn();
      expect(turn, equals(1));

      final nextTurn = await db.gameDataDao.advanceTurn();
      expect(nextTurn, equals(2));

      final current = await db.gameDataDao.getTurn();
      expect(current, equals(2));
    });

    test('ShipModels catalog is seeded with 47 models', () async {
      final models = await db.catalogDao.getAllShipModels();
      expect(models.length, equals(47));

      final quetzal = await db.catalogDao.getShipModel('Quetzal');
      expect(quetzal, isNotNull);
      expect(quetzal?.shipClass, equals('Courier'));
      expect(quetzal?.size, equals(1));
    });

    test('ShipModsAvailable catalog is seeded with 26 modules', () async {
      final mods = await db.catalogDao.getAllAvailableMods();
      expect(mods.length, equals(26));
    });

    test('MissionInterruptors and TextGenerator seeded properly', () async {
      final interruptors = await db.missionDao.getAllInterruptors();
      expect(interruptors.length, equals(9));

      final textGen = await db.select(db.missionTextGenerator).get();
      expect(textGen.length, equals(44));
    });

    test('ScavengeList and CrewGenerate seeded properly', () async {
      final scavenge = await db.catalogDao.getAllScavengeItems();
      expect(scavenge.length, equals(92));

      final crewNames = await db.select(db.crewGenerate).get();
      expect(crewNames.length, equals(1256));
    });

    test('CorpDao and InventoryDao handle corporation data correctly', () async {
      await db.corpDao.createCorp('Aegis Mining');
      final corp = await db.corpDao.getCorpByName('Aegis Mining');
      expect(corp, isNotNull);
      expect(corp?.username, equals('Aegis Mining'));

      await db.inventoryDao.setItemQuantity('Aegis Mining', 'Solars', 250000);
      await db.inventoryDao.setItemQuantity('Aegis Mining', 'Water Ice', 150);

      final solars = await db.inventoryDao.getItemQuantity('Aegis Mining', 'Solars');
      expect(solars, equals(250000));

      await db.inventoryDao.adjustItemQuantity('Aegis Mining', 'Solars', -5000);
      final adjustedSolars = await db.inventoryDao.getItemQuantity('Aegis Mining', 'Solars');
      expect(adjustedSolars, equals(245000));

      final inventory = await db.inventoryDao.getCorpInventory('Aegis Mining');
      expect(inventory.length, equals(2));
    });

    test('ResearchDao handles level progression', () async {
      await db.researchDao.upsertResearch('Aegis Mining', 'Astrogation', 1, 150, 300);
      final research = await db.researchDao.getResearchItem('Aegis Mining', 'Astrogation');

      expect(research, isNotNull);
      expect(research?.level, equals(1));
      expect(research?.progress, equals(150));
      expect(research?.nextGoal, equals(300));
    });
  });
}

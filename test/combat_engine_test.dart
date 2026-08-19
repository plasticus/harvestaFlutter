import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/combat/combat_models.dart';
import 'package:harvesta/game/combat/combat_engine.dart';
import 'package:harvesta/game/combat/combat_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late CombatService combatService;

  const playerCorp = 'Hyperion Tactical Systems';
  const enemyCorp = 'Red Nebula Corsairs';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    combatService = CombatService(db, customRng: Random(42));

    await provisioningService.provisionNewGame(
      corpName: playerCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 7 Pure Dart Combat Engine Verification', () {
    test('Simulates step-by-step combat round with initiative, damage, and repairs', () {
      final teamA = [
        CombatParticipant(
          corpName: playerCorp,
          squadron: 'Alpha Squadron',
          shipName: 'HTS Defender',
          shipClass: 'Corvette',
          shipModel: 'Magpie',
          shipSize: 1,
          baseValue: 400000,
          hp: 90,
          maxHp: 100,
          cargo: 20,
          maxCargo: 20,
          engines: 80,
          maxEngines: 80,
          maneuv: 75,
          maxManeuv: 75,
          weapCtrl: 60,
          maxWeapCtrl: 60,
          lifeSupp: 50,
          maxLifeSupp: 50,
          weapons: [
            const CombatWeapon(name: 'Rail Gun Array', power: 50),
          ],
          armor: const CombatArmor(name: 'Ceramic Composite', power: 30),
          officers: [
            const CombatOfficer(id: 1, name: 'Commander Adams', role: 'Captain', shipWeapons: 65, pilot: 60),
            const CombatOfficer(id: 2, name: 'Engineer Scott', role: 'Second Officer', repair: 70),
          ],
          quirks: ['Glitchy Coolant Pump'],
        ),
      ];

      final teamB = [
        CombatParticipant(
          corpName: enemyCorp,
          squadron: 'Red Corsairs',
          shipName: 'Corsair Raider',
          shipClass: 'Corvette',
          shipModel: 'Kestrel Light Raider',
          shipSize: 1,
          baseValue: 350000,
          hp: 75,
          maxHp: 75,
          cargo: 15,
          maxCargo: 15,
          engines: 70,
          maxEngines: 70,
          maneuv: 60,
          maxManeuv: 60,
          weapCtrl: 50,
          maxWeapCtrl: 50,
          lifeSupp: 40,
          maxLifeSupp: 40,
          weapons: [
            const CombatWeapon(name: 'Ion Pulse Battery', power: 45),
          ],
          armor: const CombatArmor(name: 'Plasteel Plating', power: 20),
        ),
      ];

      final engine = CombatEngine(
        teamA: teamA,
        teamB: teamB,
        squadronA: 'Alpha Squadron',
        squadronB: 'Red Corsairs',
        corpNameA: playerCorp,
        corpNameB: enemyCorp,
        customRng: Random(10),
      );

      final roundLog = engine.executeRound();

      expect(roundLog.round, equals(1));
      expect(roundLog.actions, isNotEmpty);
      expect(engine.roundHistory.length, equals(1));
    });

    test('Simulates complete battle to decisive conclusion, generating salvage and promotions', () {
      final teamA = [
        CombatParticipant(
          corpName: playerCorp,
          squadron: 'Alpha Squadron',
          shipName: 'HTS Vanguard',
          shipClass: 'Corvette',
          shipModel: 'Magpie',
          shipSize: 1,
          baseValue: 500000,
          hp: 120,
          maxHp: 120,
          cargo: 25,
          maxCargo: 25,
          engines: 90,
          maxEngines: 90,
          maneuv: 85,
          maxManeuv: 85,
          weapCtrl: 70,
          maxWeapCtrl: 70,
          lifeSupp: 60,
          maxLifeSupp: 60,
          weapons: [
            const CombatWeapon(name: 'Heavy Dual Railguns', power: 65),
          ],
          armor: const CombatArmor(name: 'Reinforced Plating', power: 40),
          officers: [
            const CombatOfficer(id: 1, name: 'Captain Vance', role: 'Captain', leadership: 60, shipWeapons: 70),
            const CombatOfficer(id: 2, name: 'Pilot Kara', role: 'Pilot', pilot: 75),
          ],
        ),
      ];

      final teamB = [
        CombatParticipant(
          corpName: enemyCorp,
          squadron: 'Red Corsairs',
          shipName: 'Weak Corsair Skiff',
          shipClass: 'Courier',
          shipModel: 'Kestrel',
          shipSize: 1,
          baseValue: 150000,
          hp: 30,
          maxHp: 30,
          cargo: 10,
          maxCargo: 10,
          engines: 50,
          maxEngines: 50,
          maneuv: 40,
          maxManeuv: 40,
          weapCtrl: 30,
          maxWeapCtrl: 30,
          lifeSupp: 30,
          maxLifeSupp: 30,
          weapons: [
            const CombatWeapon(name: 'Light Autocannon', power: 25),
          ],
        ),
      ];

      final engine = CombatEngine(
        teamA: teamA,
        teamB: teamB,
        squadronA: 'Alpha Squadron',
        squadronB: 'Red Corsairs',
        corpNameA: playerCorp,
        corpNameB: enemyCorp,
        customRng: Random(42),
      );

      final result = engine.simulateFullBattle();

      expect(result.totalRounds, greaterThanOrEqualTo(1));
      expect(result.winnerSquadron, equals('Alpha Squadron'));
      expect(result.isVictory, isTrue);
      expect(result.salvageWreckages, isNotEmpty);
      expect(result.officerPromotions, isNotEmpty);
    });

    test('CombatService commits combat damages, salvage, and officer skill gains to database', () async {
      final teamA = await combatService.buildParticipantsFromSquadron(playerCorp, 'Alpha Squadron');
      expect(teamA, isNotEmpty);

      final teamB = combatService.buildHostileEnemySquadron(
        enemyCorpName: enemyCorp,
        enemySquadronName: 'Corsair Strike Group',
        threatIndex: 1,
      );
      expect(teamB, isNotEmpty);

      final engine = CombatEngine(
        teamA: teamA,
        teamB: teamB,
        squadronA: 'Alpha Squadron',
        squadronB: 'Corsair Strike Group',
        corpNameA: playerCorp,
        corpNameB: enemyCorp,
        customRng: Random(42),
      );

      final result = engine.simulateFullBattle();

      await combatService.commitCombatResults(
        playerCorp: playerCorp,
        result: result,
      );

      // Verify salvage records in salvage table
      final salvageEntries = await (db.select(db.salvage)..where((s) => s.corpName.equals(playerCorp))).get();
      expect(salvageEntries, isNotEmpty);
    });
  });
}

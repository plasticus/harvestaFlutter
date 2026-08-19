// ignore_for_file: avoid_print
import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/turn_engine.dart';
import 'package:harvesta/game/station/scanning_service.dart';
import 'package:harvesta/game/station/mining_service.dart';
import 'package:harvesta/game/station/research_service.dart';
import 'package:harvesta/game/economy/market_price_service.dart';
import 'package:harvesta/game/missions/mission_generator_service.dart';
import 'package:harvesta/game/missions/mission_runner_service.dart';
import 'package:harvesta/game/fleet/ship_service.dart';
import 'package:harvesta/game/ai/ai_corp_service.dart';
import 'package:harvesta/game/advisor/gregg_advisor_service.dart';
import 'package:harvesta/game/combat/combat_engine.dart';
import 'package:harvesta/game/combat/combat_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late TurnEngine turnEngine;
  late ScanningService scanningService;
  late MiningService miningService;
  late ResearchService researchService;
  late MissionGeneratorService missionGenerator;
  late MissionRunnerService missionRunner;
  late ShipService shipService;
  late AiCorpService aiService;
  late GreggAdvisorService advisorService;
  late CombatService combatService;

  const playerCorp = 'Aegis Orbital Syndicate';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    turnEngine = TurnEngine(db, customRng: Random(42));
    scanningService = ScanningService(db, customRng: Random(42));
    miningService = MiningService(db);
    researchService = ResearchService(db, customRng: Random(42));
    missionGenerator = MissionGeneratorService(db, customRng: Random(42));
    missionRunner = MissionRunnerService(db, customRng: Random(42));
    shipService = ShipService(db);
    aiService = AiCorpService(db, customRng: Random(42));
    advisorService = GreggAdvisorService(db, customRng: Random(42));
    combatService = CombatService(db, customRng: Random(42));

    await provisioningService.provisionNewGame(
      corpName: playerCorp,
      heritage: 'Earth',
      startingSolars: 2500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('Simulates 20 complete game turns with full operational loop and AI rivals', () async {
    print('🚀 Commencing 20-Turn Deep Space Stress Simulation for [$playerCorp]...\n');

    for (var turn = 1; turn <= 20; turn++) {
      // 1. Gregg Executive Briefing
      final briefing = await advisorService.generateExecutiveBriefing(corpName: playerCorp, turn: turn);
      expect(briefing, isNotEmpty);

      // 2. Fleet Drydock Maintenance & Fleet Commissioning
      final currentShips = await db.fleetDao.getSquadronShips(playerCorp, 'Alpha Squadron');
      if (currentShips.isEmpty) {
        // Commission replacement vessel if lost in combat
        await shipService.purchaseShip(
          corpName: playerCorp,
          modelName: 'Quetzal',
          shipName: 'Aegis Vanguard T$turn',
          squadron: 'Alpha Squadron',
          turn: turn,
        );
      } else {
        // Repair any damaged hulls
        for (final s in currentShips) {
          if (s.hp < s.maxHp) {
            await shipService.repairShip(
              corpName: playerCorp,
              shipName: s.shipName,
              turn: turn,
              inHouse: false,
            );
          }
        }
      }

      // 3. Asteroid Radar Sweep
      final scanResult = await scanningService.executeRadarSweep(playerCorp, turn);
      expect(scanResult.discoveredAsteroids, isNotEmpty);

      // 4. Mining Operation
      final targetAsteroid = scanResult.discoveredAsteroids.first;
      final miningResult = await miningService.executeMining(
        corpName: playerCorp,
        squadron: 'Alpha Squadron',
        asteroidName: targetAsteroid.asteroidName,
      );
      expect(miningResult.extractedM3, greaterThan(0));

      // 5. Applied R&D Research Cycle
      final researchTrees = ['asteroidMining', 'asteroidScanning', 'astrogation', 'combatTargeting', 'armorSystems', 'shipBay'];
      final targetTree = researchTrees[turn % researchTrees.length];
      final researchResult = await researchService.executeResearchCycle(
        corpName: playerCorp,
        researchType: targetTree,
      );
      expect(researchResult.rpGained, greaterThan(0));

      // 6. Commodity Market Trading (Sell a portion of mined resources)
      final minedCommodities = miningResult.yields.keys.toList();
      if (minedCommodities.isNotEmpty) {
        final commodityToSell = minedCommodities.first;
        final sellQty = min(20, miningResult.yields[commodityToSell] ?? 10);
        if (sellQty > 0) {
          final priceInfo = MarketPriceService.getPrice(commodity: commodityToSell, turn: turn);
          await db.inventoryDao.adjustItemQuantity(playerCorp, commodityToSell, -sellQty);
          await db.inventoryDao.adjustItemQuantity(playerCorp, 'Solars', sellQty * priceInfo.sellPrice);
        }
      }

      // 7. Mission Dispatch & Expedition Completion
      final missions = await missionGenerator.generateMissions(playerCorp, turn);
      expect(missions, isNotEmpty);
      final contract = missions.first;
      final snap = await missionRunner.getSquadronSnapshot(playerCorp, 'Alpha Squadron');
      expect(snap.ships, isNotEmpty);

      final missionOutcome = await missionRunner.completeMission(
        corpName: playerCorp,
        missionId: contract.id,
        squadronName: 'Alpha Squadron',
        turn: turn,
      );
      expect(missionOutcome.payout, greaterThan(0));

      // 8. Tactical Combat Encounter Simulation (Simulate a combat skirmish every 4 turns)
      if (turn % 4 == 0) {
        final teamA = await combatService.buildParticipantsFromSquadron(playerCorp, 'Alpha Squadron');
        if (teamA.isNotEmpty) {
          final teamB = combatService.buildHostileEnemySquadron(
            enemyCorpName: 'Red Nebula Corsairs',
            enemySquadronName: 'Corsair Wolfpack',
            threatIndex: contract.cr,
          );
          final engine = CombatEngine(
            teamA: teamA,
            teamB: teamB,
            squadronA: 'Alpha Squadron',
            squadronB: 'Corsair Wolfpack',
            corpNameA: playerCorp,
            corpNameB: 'Red Nebula Corsairs',
            customRng: Random(turn),
          );
          final combatResult = engine.simulateFullBattle();
          await combatService.commitCombatResults(playerCorp: playerCorp, result: combatResult);
          expect(combatResult.totalRounds, greaterThanOrEqualTo(1));
        }
      }

      // 9. Advance Universe Turn (Executes AI Megacorps & Financial Ledgers)
      final turnResult = await turnEngine.advanceTurn(playerCorp);
      expect(turnResult.newTurn, equals(turn + 1));

      // 10. Verify System Leaderboard & Rankings
      final leaderboard = await aiService.getRankedLeaderboard(playerCorp: playerCorp, turn: turn + 1);
      expect(leaderboard.length, equals(7)); // Player + 6 Rival Megacorps

      // Print telemetry snapshot
      final playerStats = leaderboard.firstWhere((c) => c.isPlayer);
      print('  ✓ Turn #${turn.toString().padLeft(2, '0')} Complete | Rank: #${playerStats.rank}/7 | Net Worth: ⁂${playerStats.netWorth.toString().padLeft(9, ' ')} | Solars: ⁂${playerStats.solars.toString().padLeft(9, ' ')} | Fleet: ${playerStats.shipCount} ships');
    }

    // Final Post-20-Turn State Verification
    final finalTurn = await db.gameDataDao.getTurn();
    expect(finalTurn, equals(21));

    final finalLedger = await db.ledgerDao.getLedgerHistory(playerCorp);
    expect(finalLedger.length, greaterThanOrEqualTo(20));

    final finalSalvage = await (db.select(db.salvage)..where((s) => s.corpName.equals(playerCorp))).get();
    print('\n🏁 20-Turn Stress Simulation Concluded Successfully with 0 errors!');
    print('   • Total Turn Cycles Completed: 20');
    print('   • Final Global Turn: #$finalTurn');
    print('   • Financial Ledger Records: ${finalLedger.length}');
    print('   • Derelict Salvage Caches Created: ${finalSalvage.length}');
  });
}

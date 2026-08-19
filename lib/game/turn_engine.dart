import 'dart:math';
import 'package:drift/drift.dart';
import '../data/app_database.dart';
import '../models/turn_result.dart';
import 'ai/ai_corp_service.dart';

class TurnEngine {
  final AppDatabase db;
  final Random rng;

  TurnEngine(this.db, {Random? customRng}) : rng = customRng ?? Random();

  /// Advances the entire game universe by one turn cycle.
  Future<TurnResult> advanceTurn(String playerCorp) async {
    final currentTurn = await db.gameDataDao.getTurn();
    final nextTurn = currentTurn + 1;
    final logs = <String>[];

    // 1. Advance Global Game Turn
    await db.gameDataDao.setTurn(nextTurn);
    logs.add('🚀 Sector Cycle advanced to Turn #$nextTurn.');

    // 2. Generate Missions for the New Turn
    final missionsCreated = await _generateMissionsForTurn(playerCorp, nextTurn);
    logs.add('📋 Generated $missionsCreated new contracts on the Mission Board.');

    // 3. Replenish and Cycle Cadet Academy
    final cadetsAvailable = await _replenishCadetAcademy(playerCorp);
    logs.add('🎓 Cadet Academy refreshed ($cadetsAvailable candidates available).');

    // 4. Reset Corporation Action Lockouts for the New Turn
    await db.ledgerDao.recordTurnAction(
      playerCorp,
      nextTurn,
      CorpTurnActionsCompanion.insert(
        corpName: playerCorp,
        gameTurn: nextTurn,
        scanDone: const Value(false),
        mineDone: const Value(false),
        researchDone: const Value(false),
        cadetsDone: const Value(false),
        expeditionDone: const Value(false),
        marketDone: const Value(false),
      ),
    );
    logs.add('⚡ Action limits reset for Turn #$nextTurn.');

    // 5. Run AI Competitor Turns
    final aiLogs = await _runAiCorps(nextTurn, playerCorp);
    logs.addAll(aiLogs);

    // 6. Record Ledger Financial Snapshot
    final solars = await db.inventoryDao.getItemQuantity(playerCorp, 'Solars');
    final ships = await db.fleetDao.getCorpShips(playerCorp);
    final fleetVal = ships.fold<int>(0, (sum, s) => sum + s.value);
    final netWorth = solars + fleetVal + 50000;

    await db.ledgerDao.recordLedgerEntry(
      CorpFinanceLedgerCompanion.insert(
        corpName: playerCorp,
        gameTurn: nextTurn,
        netWorth: Value(netWorth),
        solars: Value(solars),
        fleetVal: Value(fleetVal),
        materialsVal: const Value(50000),
        revenue: const Value(0),
        expenses: const Value(0),
        notes: Value('Turn #$nextTurn Cycle Start Snapshot'),
      ),
    );
    logs.add('📊 Financial ledger updated. Net Worth: ⁂$netWorth.');

    return TurnResult(
      previousTurn: currentTurn,
      newTurn: nextTurn,
      corpName: playerCorp,
      logs: logs,
      newMissionsGenerated: missionsCreated,
      newCadetsAvailable: cadetsAvailable,
      solarsDelta: 0,
    );
  }

  Future<int> _generateMissionsForTurn(String corpName, int turn) async {
    // Clear old expired missions
    await db.missionDao.clearOldMissions(corpName, turn);

    final missionTypes = [
      'Transport',
      'Attack',
      'Patrol',
      'Mine',
      'Salvage',
      'Espionage',
      'Research',
      'Diplomatic',
      'Bounty',
    ];

    final resourceBonuses = [
      'Life Support Gases',
      'Fuel Gases',
      'Conductive Metals',
      'Zero-G Construction Metals',
      'Surface Construction Metals',
      'Other Valuable Elements',
      'Water Ice',
    ];

    var created = 0;
    for (var i = 0; i < 5; i++) {
      final type = missionTypes[rng.nextInt(missionTypes.length)];
      final distance = (rng.nextInt(580) + 20) / 100.0; // 0.20 to 6.00 AU
      final cr = rng.nextInt(3) + 1; // CR 1 to 3
      final payout = 180000 + rng.nextInt(70000) + (distance * 3000).round() + (cr * 5000);

      String bonus;
      int bonusAmt;
      final bonusRoll = rng.nextInt(3);
      if (bonusRoll == 0) {
        bonus = 'Solars';
        bonusAmt = (rng.nextInt(8) + 8) * 1000;
      } else if (bonusRoll == 1) {
        bonus = 'a highly prospected cadet';
        bonusAmt = 1;
      } else {
        final res = resourceBonuses[rng.nextInt(resourceBonuses.length)];
        bonus = 'm³ $res';
        bonusAmt = rng.nextInt(150) + 50;
      }

      final narrative = 'Priority operation in Sector $turn-${i + 1}: $type dispatch required at ${distance.toStringAsFixed(2)} AU. Threat Rating: CR-$cr.';

      await db.into(db.missionHolder).insert(
            MissionHolderCompanion.insert(
              corpName: Value(corpName),
              gameTurn: Value(turn),
              type: Value(type),
              distance: Value(distance),
              cr: Value(cr),
              payout: Value(payout),
              bonus: Value(bonus),
              bonusAmt: Value(bonusAmt),
              textContent: Value(narrative),
              resultFail: const Value('Mission objectives incomplete.'),
              resultPass: const Value('Mission completed successfully.'),
            ),
          );
      created++;
    }

    return created;
  }

  Future<int> _replenishCadetAcademy(String corpName) async {
    final available = await db.crewDao.getAvailableCadets();
    final needed = 20 - available.length;

    if (needed > 0) {
      final namePool = await db.select(db.crewGenerate).get();

      for (var i = 0; i < needed; i++) {
        String cadetName;
        String? nationality;
        String? gender;

        if (namePool.isNotEmpty) {
          final entry = namePool[rng.nextInt(namePool.length)];
          cadetName = '${entry.forename ?? 'Cadet'} ${entry.surname ?? 'Novak'}';
          nationality = entry.nationality;
          gender = entry.gender;
        } else {
          cadetName = 'Cadet #${rng.nextInt(9000) + 1000}';
        }

        await db.into(db.cadets).insert(
              CadetsCompanion.insert(
                corpName: Value(corpName),
                name: cadetName,
                status: const Value('Available'),
                nationality: Value(nationality),
                gender: Value(gender),
                leadership: Value(rng.nextInt(25) + 5),
                influence: Value(rng.nextInt(25) + 5),
                pilot: Value(rng.nextInt(25) + 5),
                computation: Value(rng.nextInt(25) + 5),
                repair: Value(rng.nextInt(25) + 5),
                shipWeapons: Value(rng.nextInt(25) + 5),
                firearms: Value(rng.nextInt(25) + 5),
                melee: Value(rng.nextInt(25) + 5),
                athletics: Value(rng.nextInt(25) + 5),
              ),
            );
      }
    }

    final total = await db.crewDao.getAvailableCadets();
    return total.length;
  }

  Future<List<String>> _runAiCorps(int turn, String playerCorp) async {
    final aiService = AiCorpService(db, customRng: rng);
    await aiService.simulateTurnForAllAi(turn: turn, playerCorp: playerCorp);

    return [
      '🤖 6 Rival Mega-Corporations completed market trades, research breakthroughs, and fleet deployments.',
    ];
  }
}

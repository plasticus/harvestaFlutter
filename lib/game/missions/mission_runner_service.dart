import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../economy/ledger_service.dart';
import 'interruptor_engine.dart';
import 'mission_generator_service.dart';

class MissionCompletionResult {
  final int payout;
  final String bonus;
  final int bonusAmt;
  final String narrative;
  final List<String> skillPromotions;

  const MissionCompletionResult({
    required this.payout,
    required this.bonus,
    required this.bonusAmt,
    required this.narrative,
    required this.skillPromotions,
  });
}

class MissionRunnerService {
  final AppDatabase db;
  final Random rng;

  MissionRunnerService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  /// Captures current squadron stats, ship attributes, and officer skills
  Future<SquadronSnapshot> getSquadronSnapshot(String corpName, String squadronName) async {
    final ships = await db.fleetDao.getSquadronShips(corpName, squadronName);
    final shipSnapshots = <SquadronShipSnapshot>[];
    final officerSnapshots = <SquadronOfficerSnapshot>[];

    for (final s in ships) {
      final mods = await db.fleetDao.getShipMods(s.shipName);
      final pdcPower = mods
          .where((m) => (m.modName ?? '').toLowerCase().contains('point defense'))
          .fold<int>(0, (sum, m) => sum + m.power);

      shipSnapshots.add(
        SquadronShipSnapshot(
          shipName: s.shipName,
          model: s.shipModel ?? 'Standard Hull',
          hp: s.hp,
          maxHp: s.maxHp,
          engines: s.engines,
          maneuv: s.maneuv,
          weapCtrl: s.weapCtrl,
          cargo: s.cargo,
          pdcPower: pdcPower,
        ),
      );

      final officers = await (db.select(db.crew)
            ..where((c) =>
                c.corpName.equals(corpName) &
                c.shipName.equals(s.shipName) &
                c.assignment.isNotIn(['', 'Unassigned', 'Research'])))
          .get();

      for (final o in officers) {
        officerSnapshots.add(
          SquadronOfficerSnapshot(
            id: o.id,
            name: o.name,
            assignment: o.assignment,
            leadership: o.leadership,
            influence: o.influence,
            pilot: o.pilot,
            computation: o.computation,
            repair: o.repair,
            shipWeapons: o.shipWeapons,
            fighting: o.fighting,
            athletics: o.athletics,
          ),
        );
      }
    }

    return SquadronSnapshot(
      squadronName: squadronName,
      ships: shipSnapshots,
      officers: officerSnapshots,
    );
  }

  /// Authorizes contract, debits fuel costs, and initializes flight run
  Future<bool> startMission({
    required String corpName,
    required int missionId,
    required String squadronName,
    required int turn,
  }) async {
    final mission = await (db.select(db.missionHolder)..where((m) => m.id.equals(missionId))).getSingleOrNull();
    if (mission == null) {
      throw ArgumentError('Mission contract #$missionId not found.');
    }

    final gen = MissionGeneratorService(db, customRng: rng);
    final fuelCost = await gen.calculateFuelCost(corpName, mission.distance);

    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    if (solars < fuelCost) {
      throw StateError('Insufficient Solars for mission fuel. Cost: ⁂$fuelCost (Available: ⁂$solars).');
    }

    // Deduct fuel expense
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -fuelCost);

    final ledger = LedgerService(db);
    await ledger.recordExpense(
      corpName: corpName,
      turn: turn,
      amount: fuelCost,
      category: 'operations',
      description: 'Fuel & transit fees for ${mission.type} expedition ($squadronName)',
    );

    return true;
  }

  /// Determines if an encounter occurs at the given waypoint step (45% probability)
  MissionInterruptor? rollEncounter({required int step, required int cr}) {
    if (step >= 3) return null; // Final objective resolution at step 3

    final roll = rng.nextInt(100);
    if (roll < 45) {
      final types = [0, 1, 2, 3];
      final chosen = types[rng.nextInt(types.length)];
      switch (chosen) {
        case 0:
          return DebrisFieldInterruptor(cr: cr);
        case 1:
          return PirateInterruptor(cr: cr);
        case 2:
          return SalvageInterruptor(cr: cr);
        default:
          return AnomalyInterruptor(cr: cr);
      }
    }
    return null;
  }

  /// Resolves chosen tactical action for an encounter and applies outcome to database
  Future<InterruptorOutcome> resolveEncounter({
    required String corpName,
    required String squadronName,
    required MissionInterruptor interruptor,
    required String choiceKey,
    required int turn,
  }) async {
    final squadron = await getSquadronSnapshot(corpName, squadronName);
    final outcome = interruptor.resolve(
      choiceKey: choiceKey,
      squadron: squadron,
      rng: rng,
    );

    // Apply hull damage if any
    for (final entry in outcome.hullDamage.entries) {
      final ship = await db.fleetDao.getShipByName(entry.key);
      if (ship != null) {
        final newHp = max(0, ship.hp - entry.value);
        await (db.update(db.fleet)..where((f) => f.shipName.equals(entry.key))).write(
          FleetCompanion(hp: Value(newHp)),
        );
      }
    }

    // Apply Solars reward if any
    if (outcome.solarsGained > 0) {
      await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', outcome.solarsGained);
      final ledger = LedgerService(db);
      await ledger.recordRevenue(
        corpName: corpName,
        turn: turn,
        amount: outcome.solarsGained,
        category: 'expeditions',
        description: '${interruptor.type} tactical reward',
      );
    }

    // Apply bonus items if any
    for (final entry in outcome.bonusItems.entries) {
      await db.inventoryDao.adjustItemQuantity(corpName, entry.key, entry.value);
    }

    // Apply RP reward if any
    if (outcome.rpGained > 0) {
      final activeResearch = await (db.select(db.corpResearch)
            ..where((r) => r.corpName.equals(corpName))
            ..limit(1))
          .getSingleOrNull();
      if (activeResearch != null) {
        await db.researchDao.upsertResearch(
          corpName,
          activeResearch.researchType,
          activeResearch.level,
          activeResearch.progress + outcome.rpGained,
          activeResearch.nextGoal,
        );
      }
    }

    // Apply staff skill gains if any
    for (final entry in outcome.staffPromotions.entries) {
      final officerName = entry.key;
      final promotion = entry.value;
      final officer = await (db.select(db.crew)
            ..where((c) => c.corpName.equals(corpName) & c.name.equals(officerName)))
          .getSingleOrNull();

      if (officer != null) {
        if (promotion.contains('Pilot')) {
          await (db.update(db.crew)..where((c) => c.id.equals(officer.id))).write(
            CrewCompanion(pilot: Value(officer.pilot + 1)),
          );
        } else if (promotion.contains('ShipWeapons')) {
          await (db.update(db.crew)..where((c) => c.id.equals(officer.id))).write(
            CrewCompanion(shipWeapons: Value(officer.shipWeapons + 1)),
          );
        } else if (promotion.contains('Fighting')) {
          await (db.update(db.crew)..where((c) => c.id.equals(officer.id))).write(
            CrewCompanion(fighting: Value(officer.fighting + 1)),
          );
        } else if (promotion.contains('Repair')) {
          await (db.update(db.crew)..where((c) => c.id.equals(officer.id))).write(
            CrewCompanion(repair: Value(officer.repair + 1)),
          );
        }
      }
    }

    return outcome;
  }

  /// Finalizes mission contract, credits payouts & bonuses, and clears from active board
  Future<MissionCompletionResult> completeMission({
    required String corpName,
    required int missionId,
    required String squadronName,
    required int turn,
  }) async {
    final mission = await (db.select(db.missionHolder)..where((m) => m.id.equals(missionId))).getSingleOrNull();
    if (mission == null) {
      throw ArgumentError('Mission #$missionId not found.');
    }

    // Credit contract payout
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', mission.payout);

    final ledger = LedgerService(db);
    await ledger.recordRevenue(
      corpName: corpName,
      turn: turn,
      amount: mission.payout,
      category: 'expeditions',
      description: 'Completed ${mission.type} contract (CR-${mission.cr})',
    );

    // Credit bonus
    final bonus = mission.bonus;
    final bonusAmt = mission.bonusAmt;

    if (bonus == 'Solars' && bonusAmt > 0) {
      await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', bonusAmt);
      await ledger.recordRevenue(
        corpName: corpName,
        turn: turn,
        amount: bonusAmt,
        category: 'expeditions',
        description: 'Contract performance incentive bonus',
      );
    } else if (bonus.startsWith('m³ ')) {
      final resourceName = bonus.replaceFirst('m³ ', '');
      await db.inventoryDao.adjustItemQuantity(corpName, resourceName, bonusAmt);
    } else if (bonus == 'a highly prospected cadet') {
      await db.into(db.crew).insert(
            CrewCompanion.insert(
              corpName: Value(corpName),
              name: 'Ensign Valerius Drake',
              assignment: const Value('Unassigned'),
              status: const Value('Active'),
              leadership: const Value(50),
              influence: const Value(45),
              pilot: const Value(60),
              computation: const Value(55),
              repair: const Value(50),
              shipWeapons: const Value(55),
              fighting: const Value(40),
              athletics: const Value(50),
            ),
          );
    }

    // Crew mission experience promotion
    final promotions = <String>[];
    final officers = await (db.select(db.crew)
          ..where((c) =>
              c.corpName.equals(corpName) &
              c.squadron.equals(squadronName) &
              c.assignment.isNotIn(['', 'Unassigned', 'Research'])))
        .get();

    for (final o in officers) {
      promotions.add('${o.name} (+1 Leadership)');
      await (db.update(db.crew)..where((c) => c.id.equals(o.id))).write(
        CrewCompanion(leadership: Value(o.leadership + 1)),
      );
    }

    // Delete mission from active holder
    await (db.delete(db.missionHolder)..where((m) => m.id.equals(missionId))).go();

    return MissionCompletionResult(
      payout: mission.payout,
      bonus: bonus,
      bonusAmt: bonusAmt,
      narrative: 'Contract objective completed successfully. All flight objectives met and recorded in corporate registry.',
      skillPromotions: promotions,
    );
  }
}

import 'dart:math';
import 'combat_models.dart';

class CombatEngine {
  final List<CombatParticipant> teamA;
  final List<CombatParticipant> teamB;
  final String squadronA;
  final String squadronB;
  final String corpNameA;
  final String corpNameB;
  final Random rng;

  TacticalTactic tacticA;
  TacticalTactic tacticB;

  int currentRound = 0;
  final List<CombatRoundLog> roundHistory = [];
  bool isOver = false;

  CombatEngine({
    required this.teamA,
    required this.teamB,
    required this.squadronA,
    required this.squadronB,
    required this.corpNameA,
    required this.corpNameB,
    this.tacticA = TacticalTactic.focusWeak,
    this.tacticB = TacticalTactic.focusWeak,
    Random? customRng,
  }) : rng = customRng ?? Random();

  int get teamAHull => teamA.fold<int>(0, (sum, s) => sum + max(0, s.hp));
  int get teamBHull => teamB.fold<int>(0, (sum, s) => sum + max(0, s.hp));

  bool get isTeamAAlive => teamA.any((s) => s.hp > 0);
  bool get isTeamBAlive => teamB.any((s) => s.hp > 0);

  /// Executes one discrete combat round and appends to roundHistory
  CombatRoundLog executeRound() {
    if (isOver) {
      throw StateError('Combat has already concluded.');
    }

    currentRound++;
    final personalityEvents = <String>[];
    final actionLogs = <CombatActionLog>[];
    final repairLogs = <CombatRepairLog>[];
    final moraleEvents = <String>[];

    // 1. Quirk/Personality Checks
    _processPersonalities(personalityEvents);

    // 2. Build Initiative Queue (Weaving Weapon Initiative)
    final initiativeQueue = _buildInitiativeQueue();

    // 3. Execute Weaved Weapon Firing
    for (final item in initiativeQueue) {
      if (item.ship.isDestroyed || item.ship.weapCtrl <= 0) continue;

      final isTeamA = teamA.contains(item.ship);
      final defenders = isTeamA ? teamB.where((s) => !s.isDestroyed).toList() : teamA.where((s) => !s.isDestroyed).toList();

      if (defenders.isEmpty) break; // All enemies destroyed

      final target = _selectTarget(defenders, isTeamA ? tacticA : tacticB);
      final action = _resolveWeaponAttack(item.ship, item.weapon, target, isTeamA);
      actionLogs.add(action);

      // Check if target was destroyed
      if (target.isDestroyed) {
        // Morale penalty for surviving friendly ships
        final friendlies = (isTeamA ? teamB : teamA).where((s) => !s.isDestroyed).toList();
        for (final f in friendlies) {
          f.morale = max(0.15, f.morale - 0.08);
        }
        moraleEvents.add('⚠️ ${target.shipName} destroyed! Friendly squadron morale shaken.');
      }
    }

    // 4. 2nd Officer In-Flight Emergency Repairs
    _processOfficerRepairs(repairLogs);

    // 5. Morale Cascade Check
    _checkMoraleCascades(moraleEvents);

    // 6. Round End Check
    if (!isTeamAAlive || !isTeamBAlive || currentRound >= 15) {
      isOver = true;
    }

    final roundLog = CombatRoundLog(
      round: currentRound,
      personalityEvents: personalityEvents,
      actions: actionLogs,
      repairs: repairLogs,
      moraleEvents: moraleEvents,
      teamAHull: teamAHull,
      teamBHull: teamBHull,
    );

    roundHistory.add(roundLog);
    return roundLog;
  }

  /// Simulates full battle until decisive outcome
  CombatResult simulateFullBattle() {
    while (!isOver && currentRound < 15) {
      executeRound();
    }

    String winner;
    bool victory;

    if (isTeamAAlive && !isTeamBAlive) {
      winner = squadronA;
      victory = true;
    } else if (!isTeamAAlive && isTeamBAlive) {
      winner = squadronB;
      victory = false;
    } else {
      winner = teamAHull >= teamBHull ? squadronA : squadronB;
      victory = winner == squadronA;
    }

    final salvage = _generateSalvageWreckages();
    final promotions = _generateOfficerPromotions();

    return CombatResult(
      winnerSquadron: winner,
      isVictory: victory,
      totalRounds: currentRound,
      roundLogs: roundHistory,
      allParticipants: [...teamA, ...teamB],
      salvageWreckages: salvage,
      officerPromotions: promotions,
    );
  }

  // --- PRIVATE ENGINE HELPERS ---

  void _processPersonalities(List<String> events) {
    for (final ship in [...teamA, ...teamB]) {
      if (ship.isDestroyed) continue;

      for (final quirk in ship.quirks) {
        if (rng.nextInt(100) < 20) {
          switch (quirk) {
            case 'Glitchy Coolant Pump':
              ship.weapCtrl = max(1, (ship.weapCtrl * 0.90).round());
              events.add('⚠️ ${ship.shipName}: Coolant pump glitched, reducing Weapon Control to ${ship.weapCtrl}.');
              break;
            case 'Cannae Drive Leak':
              ship.maneuv = max(1, (ship.maneuv * 0.90).round());
              events.add('⚠️ ${ship.shipName}: Drive coil pressure dropped, reducing Maneuver to ${ship.maneuv}.');
              break;
            case 'Filter Fungus':
              ship.lifeSupp = max(1, (ship.lifeSupp * 0.90).round());
              events.add('⚠️ ${ship.shipName}: Filter fungus contamination reduced Life Support to ${ship.lifeSupp}.');
              break;
            case 'Overly Talkative Ship AI':
            case 'Ghost in the Machine':
              ship.morale = max(0.15, ship.morale - 0.05);
              events.add('⚠️ ${ship.shipName}: Errant AI chatter distracted bridge crew (Morale: ${(ship.morale * 100).round()}%).');
              break;
            case 'Deviating Hull Sensors':
              ship.defense = max(0.80, ship.defense - 0.05);
              events.add('⚠️ ${ship.shipName}: Hull sensor deviation degraded defensive evasion.');
              break;
          }
        }
      }
    }
  }

  List<_InitiativeItem> _buildInitiativeQueue() {
    final list = <_InitiativeItem>[];

    for (final ship in [...teamA, ...teamB]) {
      if (ship.isDestroyed || ship.weapCtrl <= 0) continue;

      for (final weapon in ship.weapons) {
        final roll = weapon.power + rng.nextInt(21) - 10 + (ship.pilotSkill ~/ 5);
        list.add(_InitiativeItem(ship: ship, weapon: weapon, initiative: roll));
      }
    }

    list.sort((a, b) => b.initiative.compareTo(a.initiative)); // Highest initiative first
    return list;
  }

  CombatParticipant _selectTarget(List<CombatParticipant> defenders, TacticalTactic tactic) {
    if (defenders.isEmpty) {
      throw StateError('No active defenders to target.');
    }

    switch (tactic) {
      case TacticalTactic.focusWeak:
        // Target vessel with lowest current HP
        defenders.sort((a, b) => a.hp.compareTo(b.hp));
        return defenders.first;

      case TacticalTactic.targetFlagship:
        // Target highest baseValue ship
        defenders.sort((a, b) => b.baseValue.compareTo(a.baseValue));
        return defenders.first;

      case TacticalTactic.spreadFire:
        // Random target
        return defenders[rng.nextInt(defenders.length)];

      case TacticalTactic.defensiveScreen:
        // Target highest firepower enemy
        defenders.sort((a, b) {
          final pA = a.weapons.fold<int>(0, (sum, w) => sum + w.power);
          final pB = b.weapons.fold<int>(0, (sum, w) => sum + w.power);
          return pB.compareTo(pA);
        });
        return defenders.first;
    }
  }

  CombatActionLog _resolveWeaponAttack(
    CombatParticipant attacker,
    CombatWeapon weapon,
    CombatParticipant defender,
    bool isAttackerTeamA,
  ) {
    // 1. Accuracy vs Dodge Check
    final rawAcc = rng.nextInt(max(1, (attacker.weapCtrl * 0.25).round())) + (attacker.weapCtrl * 0.75).round();
    final acc = (rawAcc * attacker.morale).round() + (attacker.gunnerSkill ~/ 2);

    final rawDodge = rng.nextInt(max(1, (defender.maneuv * 0.40).round())) + (defender.maneuv * 0.40).round();
    final dodge = (rawDodge * defender.morale * defender.defense).round() + (defender.pilotSkill ~/ 2);

    final isHit = acc >= dodge;

    if (!isHit) {
      return CombatActionLog(
        round: currentRound,
        attackerShip: attacker.shipName,
        attackerSquadron: attacker.squadron,
        weaponName: weapon.name,
        targetShip: defender.shipName,
        targetSquadron: defender.squadron,
        isHit: false,
        rawDamage: 0,
        absorbedDamage: 0,
        netDamage: 0,
        narrative: '${attacker.shipName} fired ${weapon.name} at ${defender.shipName}, but the shot was evaded!',
      );
    }

    // 2. Damage & Armor Mitigation
    final rawDmg = rng.nextInt(max(1, (weapon.power * 0.25).round())) + (weapon.power * 0.75).round();
    final absorbed = min(rawDmg, (defender.armor.power * 0.25).round());
    final netDmg = max(1, rawDmg - absorbed);

    // Apply primary damage to Hull HP
    defender.hp = max(0, defender.hp - netDmg);
    defender.morale = max(0.15, defender.morale - 0.03);

    // 3. Critical Subsystem Collateral Damage (25% chance on hit)
    String? critSubsystem;
    var critDmg = 0;

    if (rng.nextInt(100) < 25) {
      final subRoll = rng.nextInt(5);
      critDmg = max(1, (netDmg * 0.35).round());

      switch (subRoll) {
        case 0:
          critSubsystem = 'Engines';
          defender.engines = max(0, defender.engines - critDmg);
          break;
        case 1:
          critSubsystem = 'Maneuver';
          defender.maneuv = max(0, defender.maneuv - critDmg);
          break;
        case 2:
          critSubsystem = 'Weapon Control';
          defender.weapCtrl = max(0, defender.weapCtrl - critDmg);
          break;
        case 3:
          critSubsystem = 'Life Support';
          defender.lifeSupp = max(0, defender.lifeSupp - critDmg);
          break;
        case 4:
          critSubsystem = 'Cargo';
          defender.cargo = max(0, defender.cargo - critDmg);
          break;
      }
    }

    final targetDestroyed = defender.isDestroyed;

    String narrative = '${attacker.shipName} fired ${weapon.name} into ${defender.shipName} for $netDmg damage (absorbed $absorbed)';
    if (critSubsystem != null) {
      narrative += ' - Critical hit to $critSubsystem (-$critDmg)!';
    }
    if (targetDestroyed) {
      narrative += ' 💥 Target vessel destroyed!';
    }

    return CombatActionLog(
      round: currentRound,
      attackerShip: attacker.shipName,
      attackerSquadron: attacker.squadron,
      weaponName: weapon.name,
      targetShip: defender.shipName,
      targetSquadron: defender.squadron,
      isHit: true,
      rawDamage: rawDmg,
      absorbedDamage: absorbed,
      netDamage: netDmg,
      criticalSubsystem: critSubsystem,
      criticalSubsystemDamage: critDmg,
      targetDestroyed: targetDestroyed,
      narrative: narrative,
    );
  }

  void _processOfficerRepairs(List<CombatRepairLog> repairs) {
    for (final ship in [...teamA, ...teamB]) {
      if (ship.isDestroyed || ship.hp >= ship.maxHp) continue;

      final so = ship.secondOfficer;
      if (so != null && so.repair > 0) {
        final rep = rng.nextInt(max(1, (so.repair ~/ 30))) + 1;
        ship.hp = min(ship.maxHp, ship.hp + rep);

        repairs.add(
          CombatRepairLog(
            round: currentRound,
            shipName: ship.shipName,
            engineerName: so.name,
            hpRestored: rep,
          ),
        );
      }
    }
  }

  void _checkMoraleCascades(List<String> events) {
    final deadA = teamA.where((s) => s.isDestroyed).length;
    final deadB = teamB.where((s) => s.isDestroyed).length;

    if (deadA >= (teamA.length / 2.0).ceil()) {
      for (final s in teamA.where((s) => !s.isDestroyed)) {
        s.morale = max(0.15, s.morale - 0.05);
      }
    }

    if (deadB >= (teamB.length / 2.0).ceil()) {
      for (final s in teamB.where((s) => !s.isDestroyed)) {
        s.morale = max(0.15, s.morale - 0.05);
      }
    }
  }

  List<SalvageWreckageRecord> _generateSalvageWreckages() {
    final list = <SalvageWreckageRecord>[];

    for (final ship in [...teamA, ...teamB]) {
      if (ship.isDestroyed) {
        final m3 = max(50, ship.shipSize * 50);
        final surfaceM = (m3 * 0.25).round();
        final zeroGM = (m3 * 0.30).round();
        final conductiveM = (m3 * 0.15).round();
        final lifeSuppG = (m3 * 0.10).round();
        final fuelG = (m3 * 0.10).round();
        final ove = (m3 * 0.05).round();
        final waterIce = max(0, m3 - (surfaceM + zeroGM + conductiveM + lifeSuppG + fuelG + ove));

        list.add(
          SalvageWreckageRecord(
            salvageName: '${ship.shipName} Wreckage',
            corpName: corpNameA,
            totalVolume: m3,
            zeroGMetals: zeroGM,
            surfaceMetals: surfaceM,
            conductiveMetals: conductiveM,
            lifeSupportGases: lifeSuppG,
            fuelGases: fuelG,
            otherValuableElements: ove,
            waterIce: waterIce,
          ),
        );
      }
    }

    return list;
  }

  Map<int, List<String>> _generateOfficerPromotions() {
    final map = <int, List<String>>{};

    for (final ship in teamA) {
      for (final officer in ship.officers) {
        final gains = <String>[];
        if (officer.role == 'First Officer') {
          gains.add('+1 ShipWeapons');
        } else if (officer.role == 'Pilot') {
          gains.add('+1 Pilot');
        } else if (officer.role == 'Second Officer') {
          gains.add('+1 Repair');
        } else if (officer.role == 'Captain') {
          gains.add('+1 Leadership');
        }
        if (gains.isNotEmpty) {
          map[officer.id] = gains;
        }
      }
    }

    return map;
  }
}

class _InitiativeItem {
  final CombatParticipant ship;
  final CombatWeapon weapon;
  final int initiative;

  const _InitiativeItem({
    required this.ship,
    required this.weapon,
    required this.initiative,
  });
}

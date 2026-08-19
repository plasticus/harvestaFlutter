import 'dart:math';

class SquadronShipSnapshot {
  final String shipName;
  final String model;
  final int hp;
  final int maxHp;
  final int engines;
  final int maneuv;
  final int weapCtrl;
  final int cargo;
  final int pdcPower;

  const SquadronShipSnapshot({
    required this.shipName,
    required this.model,
    required this.hp,
    required this.maxHp,
    required this.engines,
    required this.maneuv,
    required this.weapCtrl,
    required this.cargo,
    required this.pdcPower,
  });
}

class SquadronOfficerSnapshot {
  final int id;
  final String name;
  final String assignment;
  final int leadership;
  final int influence;
  final int pilot;
  final int computation;
  final int repair;
  final int shipWeapons;
  final int fighting;
  final int athletics;

  const SquadronOfficerSnapshot({
    required this.id,
    required this.name,
    required this.assignment,
    required this.leadership,
    required this.influence,
    required this.pilot,
    required this.computation,
    required this.repair,
    required this.shipWeapons,
    required this.fighting,
    required this.athletics,
  });
}

class SquadronSnapshot {
  final String squadronName;
  final List<SquadronShipSnapshot> ships;
  final List<SquadronOfficerSnapshot> officers;

  const SquadronSnapshot({
    required this.squadronName,
    required this.ships,
    required this.officers,
  });

  int get numShips => max(1, ships.length);

  double get avgPilot {
    final pilots = officers.where((o) => o.assignment == 'Pilot' || o.assignment == 'Captain').toList();
    if (pilots.isEmpty) return 20.0;
    return pilots.fold<int>(0, (sum, o) => sum + o.pilot) / pilots.length;
  }

  double get avgWeapons {
    final gunners = officers.where((o) => o.assignment == 'First Officer' || o.assignment == 'Captain').toList();
    if (gunners.isEmpty) return 20.0;
    return gunners.fold<int>(0, (sum, o) => sum + o.shipWeapons) / gunners.length;
  }

  double get avgLeadership {
    final leaders = officers.where((o) => o.assignment == 'Captain').toList();
    if (leaders.isEmpty) return 20.0;
    return leaders.fold<int>(0, (sum, o) => sum + o.leadership) / leaders.length;
  }

  double get avgComputation {
    if (officers.isEmpty) return 20.0;
    return officers.fold<int>(0, (sum, o) => sum + o.computation) / officers.length;
  }

  double get avgRepair {
    final engineers = officers.where((o) => o.assignment == 'Second Officer' || o.assignment == 'Captain').toList();
    if (engineers.isEmpty) return 20.0;
    return engineers.fold<int>(0, (sum, o) => sum + o.repair) / engineers.length;
  }

  int get totalPdcPower => ships.fold<int>(0, (sum, s) => sum + s.pdcPower);
  int get totalManeuver => ships.fold<int>(0, (sum, s) => sum + s.maneuv);
}

class InterruptorChoice {
  final String key;
  final String title;
  final String skillLabel;
  final int previewRating;
  final String description;

  const InterruptorChoice({
    required this.key,
    required this.title,
    required this.skillLabel,
    required this.previewRating,
    required this.description,
  });
}

class InterruptorOutcome {
  final bool success;
  final String narrative;
  final Map<String, int> hullDamage;
  final int solarsGained;
  final int rpGained;
  final Map<String, String> staffPromotions;
  final Map<String, int> bonusItems;

  const InterruptorOutcome({
    required this.success,
    required this.narrative,
    this.hullDamage = const {},
    this.solarsGained = 0,
    this.rpGained = 0,
    this.staffPromotions = const {},
    this.bonusItems = const {},
  });
}

abstract class MissionInterruptor {
  final String type;
  final String title;
  final String description;
  final int cr;

  const MissionInterruptor({
    required this.type,
    required this.title,
    required this.description,
    required this.cr,
  });

  List<InterruptorChoice> getChoices(SquadronSnapshot squadron);

  InterruptorOutcome resolve({
    required String choiceKey,
    required SquadronSnapshot squadron,
    required Random rng,
  });
}

// 1. Debris Field Interruptor
class DebrisFieldInterruptor extends MissionInterruptor {
  const DebrisFieldInterruptor({required super.cr})
      : super(
          type: 'DebrisField',
          title: '⚠️ Sector Hazard: High-Density Debris Field',
          description:
              'Long-range telemetry detects a dense swarm of hypervelocity asteroid fragments crossing our flight corridor. Quick action from the helm or gunnery crews is required to prevent structural hull breaches.',
        );

  @override
  List<InterruptorChoice> getChoices(SquadronSnapshot squadron) {
    final pilotRating = (squadron.avgPilot * 2 + (squadron.totalManeuver / squadron.numShips)).round();
    final weapRating = (squadron.avgWeapons + squadron.totalPdcPower).round();

    return [
      InterruptorChoice(
        key: 'dodge',
        title: 'Option A: Weave Through',
        skillLabel: 'Pilot Maneuver Rating: $pilotRating',
        previewRating: pilotRating,
        description: 'Execute high-g evasive burns to weave through the debris field.',
      ),
      InterruptorChoice(
        key: 'blast',
        title: 'Option B: Blast Through',
        skillLabel: 'Point Defense Rating: $weapRating',
        previewRating: weapRating,
        description: 'Target incoming meteoroids with ship weapons and automated point defense cannons.',
      ),
    ];
  }

  @override
  InterruptorOutcome resolve({
    required String choiceKey,
    required SquadronSnapshot squadron,
    required Random rng,
  }) {
    final difficulty = rng.nextInt(35) + 30 + (cr * 15);
    final damageMap = <String, int>{};
    final staffGains = <String, String>{};

    if (choiceKey == 'dodge') {
      final score = (squadron.avgPilot * 2 + (squadron.totalManeuver / squadron.numShips)).round();
      final diff = score - difficulty;

      if (diff >= 0) {
        for (final o in squadron.officers.where((o) => o.assignment == 'Pilot')) {
          staffGains[o.name] = '+1 Pilot';
        }
        return InterruptorOutcome(
          success: true,
          narrative: '✨ Flawless evasive flying! Helm navigated the debris cluster without sustaining any hull damage.',
          staffPromotions: staffGains,
        );
      } else {
        final pct = min(0.30, (difficulty - score) * 0.02 + 0.05);
        for (final s in squadron.ships) {
          damageMap[s.shipName] = max(1, (s.maxHp * pct).round());
        }
        return InterruptorOutcome(
          success: false,
          narrative: '💥 High-velocity fragments grazed our hulls during the burn, inflicting light impact damage across the squadron.',
          hullDamage: damageMap,
        );
      }
    } else {
      final score = (squadron.avgWeapons + squadron.totalPdcPower).round();
      final diff = score - difficulty;

      if (diff >= 0) {
        for (final o in squadron.officers.where((o) => o.assignment == 'First Officer')) {
          staffGains[o.name] = '+1 ShipWeapons';
        }
        return InterruptorOutcome(
          success: true,
          narrative: '🎯 PDCs and tactical batteries vaporized incoming fragments, clearing a safe transit corridor!',
          staffPromotions: staffGains,
        );
      } else {
        final pct = min(0.35, (difficulty - score) * 0.025 + 0.08);
        for (final s in squadron.ships) {
          damageMap[s.shipName] = max(2, (s.maxHp * pct).round());
        }
        return InterruptorOutcome(
          success: false,
          narrative: '⚠️ Heavy debris saturated our point defense tracking, causing minor kinetic impact damage.',
          hullDamage: damageMap,
        );
      }
    }
  }
}

// 2. Pirate Ambush Interruptor
class PirateInterruptor extends MissionInterruptor {
  const PirateInterruptor({required super.cr})
      : super(
          type: 'Pirate',
          title: '🚨 Tactical Encounter: Belt Pirate Ambush',
          description:
              'Multiple unflagged strike vessels have dropped out of stealth signatures on an interception vector. They are powering up mass drivers and targeting locks!',
        );

  @override
  List<InterruptorChoice> getChoices(SquadronSnapshot squadron) {
    final firepower = (squadron.avgWeapons * 2 + (squadron.ships.fold<int>(0, (sum, s) => sum + s.weapCtrl) / squadron.numShips)).round();
    final speed = (squadron.avgPilot + (squadron.ships.fold<int>(0, (sum, s) => sum + s.engines) / squadron.numShips)).round();

    return [
      InterruptorChoice(
        key: 'engage',
        title: 'Option A: Engage Hostiles',
        skillLabel: 'Tactical Firepower: $firepower',
        previewRating: firepower,
        description: 'Deploy battle formation and return fire to eliminate the pirate raiders.',
      ),
      InterruptorChoice(
        key: 'evade',
        title: 'Option B: Overclock Engines',
        skillLabel: 'Sublight Velocity: $speed',
        previewRating: speed,
        description: 'Dump fuel into sublight thrusters to outrun and break target locks.',
      ),
    ];
  }

  @override
  InterruptorOutcome resolve({
    required String choiceKey,
    required SquadronSnapshot squadron,
    required Random rng,
  }) {
    final difficulty = rng.nextInt(40) + 40 + (cr * 20);
    final damageMap = <String, int>{};
    final staffGains = <String, String>{};

    if (choiceKey == 'engage') {
      final score = (squadron.avgWeapons * 2 + (squadron.ships.fold<int>(0, (sum, s) => sum + s.weapCtrl) / squadron.numShips)).round();
      if (score >= difficulty) {
        final bounty = (rng.nextInt(5) + 3) * 10000;
        for (final o in squadron.officers) {
          staffGains[o.name] = '+1 Fighting';
        }
        return InterruptorOutcome(
          success: true,
          narrative: '🏆 Tactical victory! Squadron destroyed the pirate raiders and recovered ⁂$bounty in bounty vouchers.',
          solarsGained: bounty,
          staffPromotions: staffGains,
        );
      } else {
        for (final s in squadron.ships) {
          damageMap[s.shipName] = max(5, (s.maxHp * 0.20).round());
        }
        return InterruptorOutcome(
          success: false,
          narrative: '⚠️ Fierce exchange of fire. We repelled the raiders but sustained hull damage across the squadron.',
          hullDamage: damageMap,
        );
      }
    } else {
      final score = (squadron.avgPilot + (squadron.ships.fold<int>(0, (sum, s) => sum + s.engines) / squadron.numShips)).round();
      if (score >= difficulty) {
        return const InterruptorOutcome(
          success: true,
          narrative: '🚀 Clean escape! Overclocked thrusters allowed our ships to break sensor lock and leave the pirates behind.',
        );
      } else {
        for (final s in squadron.ships) {
          damageMap[s.shipName] = max(3, (s.maxHp * 0.12).round());
        }
        return InterruptorOutcome(
          success: false,
          narrative: 'Hostile fire clipped our stern during the retreat, causing minor thruster damage before we escaped.',
          hullDamage: damageMap,
        );
      }
    }
  }
}

// 3. Salvage Derelict Interruptor
class SalvageInterruptor extends MissionInterruptor {
  const SalvageInterruptor({required super.cr})
      : super(
          type: 'Salvage',
          title: '🛰️ Deep Space Discovery: Abandoned Derelict',
          description:
              'Passive sensors picked up the faint transponder beacon of an abandoned transport hull lodged in a nearby asteroid eddy.',
        );

  @override
  List<InterruptorChoice> getChoices(SquadronSnapshot squadron) {
    final techSkill = (squadron.avgComputation + squadron.avgRepair).round();

    return [
      InterruptorChoice(
        key: 'salvage',
        title: 'Option A: Board & Strip Cargo',
        skillLabel: 'Engineering Skill: $techSkill',
        previewRating: techSkill,
        description: 'Send an EVA engineering team aboard to decrypt data cores and extract valuable components.',
      ),
      InterruptorChoice(
        key: 'ignore',
        title: 'Option B: Mark & Proceed',
        skillLabel: 'Zero Risk',
        previewRating: 100,
        description: 'Log telemetry coordinates in the corporate database and maintain mission flight path.',
      ),
    ];
  }

  @override
  InterruptorOutcome resolve({
    required String choiceKey,
    required SquadronSnapshot squadron,
    required Random rng,
  }) {
    if (choiceKey == 'ignore') {
      return const InterruptorOutcome(
        success: true,
        narrative: 'Coordinates logged. Squadron maintained cruise velocity toward target waypoint.',
      );
    }

    final techScore = (squadron.avgComputation + squadron.avgRepair).round();
    final bonusSolars = (rng.nextInt(4) + 2) * 15000;
    final staffGains = <String, String>{};

    if (techScore >= 35) {
      for (final o in squadron.officers.where((o) => o.assignment == 'Second Officer')) {
        staffGains[o.name] = '+1 Repair';
      }
      return InterruptorOutcome(
        success: true,
        narrative: '📦 Salvage operation complete! Recovered intact titanium composites and ⁂$bonusSolars in raw scrap value.',
        solarsGained: bonusSolars,
        staffPromotions: staffGains,
        bonusItems: {'Conductive Metals': 45, 'Zero-G Construction Metals': 60},
      );
    } else {
      return InterruptorOutcome(
        success: true,
        narrative: 'Derelict was partially picked over, but our crew recovered ⁂15,000 in salvageable alloy scrap.',
        solarsGained: 15000,
      );
    }
  }
}

// 4. Subspace Anomaly Interruptor
class AnomalyInterruptor extends MissionInterruptor {
  const AnomalyInterruptor({required super.cr})
      : super(
          type: 'Anomaly',
          title: '🌌 Sensor Phenomenon: Gravitational Rift',
          description:
              'A localized gravitational anomaly is warping subspace frequencies directly ahead of the squadron.',
        );

  @override
  List<InterruptorChoice> getChoices(SquadronSnapshot squadron) {
    final compRating = (squadron.avgComputation * 2).round();

    return [
      InterruptorChoice(
        key: 'scan',
        title: 'Option A: Scientific Probe & Sensor Array',
        skillLabel: 'Computation Analysis: $compRating',
        previewRating: compRating,
        description: 'Deploy sensor array to capture scientific telemetry for R&D lab research points.',
      ),
      InterruptorChoice(
        key: 'divert',
        title: 'Option B: Shield & Divert Course',
        skillLabel: 'Safe Route',
        previewRating: 100,
        description: 'Adjust course vectors to bypass the gravitational disruption.',
      ),
    ];
  }

  @override
  InterruptorOutcome resolve({
    required String choiceKey,
    required SquadronSnapshot squadron,
    required Random rng,
  }) {
    if (choiceKey == 'divert') {
      return const InterruptorOutcome(
        success: true,
        narrative: 'Squadron routed around the gravitational distortion safely.',
      );
    }

    final score = (squadron.avgComputation * 2).round();
    if (score >= 40) {
      final rp = rng.nextInt(50) + 120;
      return InterruptorOutcome(
        success: true,
        narrative: '🔬 Scientific breakthrough! Array captured exotic gravitational wave telemetry (+$rp RP added to research reserves).',
        rpGained: rp,
      );
    } else {
      return const InterruptorOutcome(
        success: true,
        narrative: 'Sensor arrays captured basic anomaly readings (+40 RP gained).',
        rpGained: 40,
      );
    }
  }
}

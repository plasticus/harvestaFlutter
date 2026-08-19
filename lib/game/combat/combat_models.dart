enum TacticalTactic {
  focusWeak,
  targetFlagship,
  spreadFire,
  defensiveScreen,
}

enum WeaponDamageType {
  railGun,
  ionCannon,
  clusterMissiles,
  laserBeam,
  torpedo,
}

class CombatWeapon {
  final String name;
  final int power;
  final WeaponDamageType damageType;

  const CombatWeapon({
    required this.name,
    required this.power,
    this.damageType = WeaponDamageType.railGun,
  });

  factory CombatWeapon.standardKinetic() {
    return const CombatWeapon(
      name: 'Standard Kinetic Cannons',
      power: 45,
      damageType: WeaponDamageType.railGun,
    );
  }
}

class CombatArmor {
  final String name;
  final int power;

  const CombatArmor({
    required this.name,
    required this.power,
  });

  factory CombatArmor.standardPlating() {
    return const CombatArmor(
      name: 'Reinforced Plating',
      power: 35,
    );
  }
}

class CombatOfficer {
  final int id;
  final String name;
  final String role; // Captain, Pilot, First Officer, Second Officer
  final int leadership;
  final int influence;
  final int pilot;
  final int computation;
  final int repair;
  final int shipWeapons;
  final int fighting;

  const CombatOfficer({
    required this.id,
    required this.name,
    required this.role,
    this.leadership = 40,
    this.influence = 40,
    this.pilot = 40,
    this.computation = 40,
    this.repair = 40,
    this.shipWeapons = 40,
    this.fighting = 40,
  });
}

class CombatParticipant {
  final String corpName;
  final String squadron;
  final String shipName;
  final String shipClass;
  final String shipModel;
  final int shipSize;
  final int baseValue;

  // 6 Subsystems
  int hp;
  final int maxHp;
  int cargo;
  final int maxCargo;
  int engines;
  final int maxEngines;
  int maneuv;
  final int maxManeuv;
  int weapCtrl;
  final int maxWeapCtrl;
  int lifeSupp;
  final int maxLifeSupp;

  double morale;
  double defense;
  List<CombatWeapon> weapons;
  CombatArmor armor;
  List<CombatOfficer> officers;
  List<String> quirks;

  CombatParticipant({
    required this.corpName,
    required this.squadron,
    required this.shipName,
    required this.shipClass,
    required this.shipModel,
    required this.shipSize,
    required this.baseValue,
    required this.hp,
    required this.maxHp,
    required this.cargo,
    required this.maxCargo,
    required this.engines,
    required this.maxEngines,
    required this.maneuv,
    required this.maxManeuv,
    required this.weapCtrl,
    required this.maxWeapCtrl,
    required this.lifeSupp,
    required this.maxLifeSupp,
    this.morale = 1.0,
    this.defense = 1.0,
    this.weapons = const [],
    CombatArmor? armor,
    this.officers = const [],
    this.quirks = const [],
  }) : armor = armor ?? CombatArmor.standardPlating();

  bool get isDestroyed => hp <= 0;
  bool get canFire => hp > 0 && weapCtrl > 0 && weapons.isNotEmpty;

  CombatOfficer? get captain => officers.where((o) => o.role == 'Captain').firstOrNull;
  CombatOfficer? get pilot => officers.where((o) => o.role == 'Pilot').firstOrNull;
  CombatOfficer? get firstOfficer => officers.where((o) => o.role == 'First Officer').firstOrNull;
  CombatOfficer? get secondOfficer => officers.where((o) => o.role == 'Second Officer').firstOrNull;

  int get gunnerSkill => firstOfficer?.shipWeapons ?? captain?.shipWeapons ?? 25;
  int get pilotSkill => pilot?.pilot ?? captain?.pilot ?? 25;
  int get engineerSkill => secondOfficer?.repair ?? 25;
  int get leadershipSkill => captain?.leadership ?? 35;
}

class CombatActionLog {
  final int round;
  final String attackerShip;
  final String attackerSquadron;
  final String weaponName;
  final String targetShip;
  final String targetSquadron;
  final bool isHit;
  final int rawDamage;
  final int absorbedDamage;
  final int netDamage;
  final String? criticalSubsystem;
  final int criticalSubsystemDamage;
  final bool targetDestroyed;
  final String narrative;

  const CombatActionLog({
    required this.round,
    required this.attackerShip,
    required this.attackerSquadron,
    required this.weaponName,
    required this.targetShip,
    required this.targetSquadron,
    required this.isHit,
    required this.rawDamage,
    required this.absorbedDamage,
    required this.netDamage,
    this.criticalSubsystem,
    this.criticalSubsystemDamage = 0,
    this.targetDestroyed = false,
    required this.narrative,
  });
}

class CombatRepairLog {
  final int round;
  final String shipName;
  final String engineerName;
  final int hpRestored;

  const CombatRepairLog({
    required this.round,
    required this.shipName,
    required this.engineerName,
    required this.hpRestored,
  });
}

class CombatRoundLog {
  final int round;
  final List<String> personalityEvents;
  final List<CombatActionLog> actions;
  final List<CombatRepairLog> repairs;
  final List<String> moraleEvents;
  final int teamAHull;
  final int teamBHull;

  const CombatRoundLog({
    required this.round,
    required this.personalityEvents,
    required this.actions,
    required this.repairs,
    required this.moraleEvents,
    required this.teamAHull,
    required this.teamBHull,
  });
}

class SalvageWreckageRecord {
  final String salvageName;
  final String corpName;
  final int totalVolume;
  final int zeroGMetals;
  final int surfaceMetals;
  final int conductiveMetals;
  final int lifeSupportGases;
  final int fuelGases;
  final int otherValuableElements;
  final int waterIce;

  const SalvageWreckageRecord({
    required this.salvageName,
    required this.corpName,
    required this.totalVolume,
    required this.zeroGMetals,
    required this.surfaceMetals,
    required this.conductiveMetals,
    required this.lifeSupportGases,
    required this.fuelGases,
    required this.otherValuableElements,
    required this.waterIce,
  });
}

class CombatResult {
  final String winnerSquadron; // squadA, squadB, or 'Draw'
  final bool isVictory;
  final int totalRounds;
  final List<CombatRoundLog> roundLogs;
  final List<CombatParticipant> allParticipants;
  final List<SalvageWreckageRecord> salvageWreckages;
  final Map<int, List<String>> officerPromotions; // officerId -> ['+1 ShipWeapons']

  const CombatResult({
    required this.winnerSquadron,
    required this.isVictory,
    required this.totalRounds,
    required this.roundLogs,
    required this.allParticipants,
    required this.salvageWreckages,
    required this.officerPromotions,
  });
}

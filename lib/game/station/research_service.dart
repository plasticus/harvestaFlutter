import 'dart:math';
import '../../data/app_database.dart';

class TechCategoryInfo {
  final String key;
  final String name;
  final String primarySkill;
  final String icon;
  final String description;

  const TechCategoryInfo({
    required this.key,
    required this.name,
    required this.primarySkill,
    required this.icon,
    required this.description,
  });
}

class ResearchCycleResult {
  final String techKey;
  final String techName;
  final int rpGained;
  final int newLevel;
  final int currentProgress;
  final int nextGoal;
  final bool leveledUp;
  final List<String> staffGains;

  const ResearchCycleResult({
    required this.techKey,
    required this.techName,
    required this.rpGained,
    required this.newLevel,
    required this.currentProgress,
    required this.nextGoal,
    required this.leveledUp,
    required this.staffGains,
  });
}

class ResearchService {
  final AppDatabase db;
  final Random rng;

  ResearchService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  static const Map<String, TechCategoryInfo> techCatalog = {
    'asteroidMining': TechCategoryInfo(
      key: 'asteroidMining',
      name: 'Asteroid Mining Tech',
      primarySkill: 'Fighting',
      icon: '⛏️',
      description: 'Increases refinery yield efficiency and reduces extraction ore waste (up to 85% yield).',
    ),
    'asteroidScanning': TechCategoryInfo(
      key: 'asteroidScanning',
      name: 'Sensor & Scanner Tech',
      primarySkill: 'Computation',
      icon: '📡',
      description: 'Expands radar sweep candidate count and unlocks massive deep-belt asteroid discovery.',
    ),
    'astrogation': TechCategoryInfo(
      key: 'astrogation',
      name: 'Astrogation & Navigation',
      primarySkill: 'Pilot',
      icon: '🧭',
      description: 'Optimizes interplanetary transit burns, reducing expedition duration and fuel consumption.',
    ),
    'combatTargeting': TechCategoryInfo(
      key: 'combatTargeting',
      name: 'Combat Targeting Algorithms',
      primarySkill: 'ShipWeapons',
      icon: '🎯',
      description: 'Calibrates tactical firing solutions, boosting ship weapon accuracy and critical hit chance.',
    ),
    'armorSystems': TechCategoryInfo(
      key: 'armorSystems',
      name: 'Ship Armor Plating Tech',
      primarySkill: 'Repair',
      icon: '🛡️',
      description: 'Hardens composite hull bulkheads against kinetic impacts and energy weapon bursts.',
    ),
    'shipBay': TechCategoryInfo(
      key: 'shipBay',
      name: 'Hangar & Bay Capacity',
      primarySkill: 'Athletics',
      icon: '📦',
      description: 'Expands cargo hold volumetric efficiency by +5% per level across all fleet squadrons.',
    ),
    'shipBuilding': TechCategoryInfo(
      key: 'shipBuilding',
      name: 'Hull Construction & Drydock',
      primarySkill: 'Repair',
      icon: '🏗️',
      description: 'Accelerates in-house drydock repair rates and lowers modular shipyard refit costs.',
    ),
    'weaponSystems': TechCategoryInfo(
      key: 'weaponSystems',
      name: 'Weapons Engineering',
      primarySkill: 'ShipWeapons',
      icon: '💥',
      description: 'Supercharges energy capacitor output and missile payload yield for offensive armaments.',
    ),
    'squadronDefense': TechCategoryInfo(
      key: 'squadronDefense',
      name: 'Squadron Defense Tactics',
      primarySkill: 'Leadership',
      icon: '🔰',
      description: 'Enhances formation interception coordination and electronic warfare countermeasures.',
    ),
    'tradeRelationships': TechCategoryInfo(
      key: 'tradeRelationships',
      name: 'Corporate Trade Relations',
      primarySkill: 'Influence',
      icon: '🤝',
      description: 'Grants +3%/level margin bonuses on commodity exchange sales and market purchases.',
    ),
  };

  /// Calculates expected research output for a discipline
  Future<int> calculateDailyRP(String corpName, String researchType) async {
    final primarySkill = techCatalog[researchType]?.primarySkill ?? 'Computation';

    // 1. Fetch assigned researchers
    final crew = await db.crewDao.getCorpCrew(corpName);
    final researchers = crew.where((c) => c.assignment == 'Research').toList();
    final numResearchers = researchers.length;

    var totalSkill = 0;
    for (final r in researchers) {
      totalSkill += _getOfficerSkill(r, primarySkill);
    }

    // 2. Fetch lab building level
    final lab = await db.stationDao.getBuilding(corpName, 'Research');
    final labLevel = lab?.level ?? 1;

    if (numResearchers > 0) {
      final baseRP = numResearchers * 8;
      final skillRP = (totalSkill * 0.45).round();
      final labMult = 1.0 + (labLevel * 0.15);
      return max(15, ((baseRP + skillRP) * labMult).round());
    } else {
      return 8; // Automated background lab output
    }
  }

  /// Advances research on the chosen discipline
  Future<ResearchCycleResult> executeResearchCycle({
    required String corpName,
    required String researchType,
  }) async {
    final techInfo = techCatalog[researchType];
    if (techInfo == null) {
      throw ArgumentError('Invalid research type "$researchType".');
    }

    final primarySkill = techInfo.primarySkill;

    // 1. Compute RP gain
    final crew = await db.crewDao.getCorpCrew(corpName);
    final researchers = crew.where((c) => c.assignment == 'Research').toList();
    final numResearchers = researchers.length;

    var totalSkill = 0;
    for (final r in researchers) {
      totalSkill += _getOfficerSkill(r, primarySkill);
    }

    final lab = await db.stationDao.getBuilding(corpName, 'Research');
    final labLevel = lab?.level ?? 1;

    int rpGain;
    if (numResearchers > 0) {
      final baseRP = numResearchers * 8;
      final skillRP = (totalSkill * 0.45).round();
      final labMult = 1.0 + (labLevel * 0.15);
      rpGain = max(15, ((baseRP + skillRP) * labMult).round() + rng.nextInt(7) + 2);
    } else {
      rpGain = rng.nextInt(8) + 5;
    }

    // 2. Researcher Skill Progressions
    final staffGains = <String>[];
    for (final sci in researchers) {
      final primaryChance = min(85, 50 + (labLevel * 5));
      if (rng.nextInt(100) < primaryChance) {
        final currentSkill = _getOfficerSkill(sci, primarySkill);
        if (currentSkill < 99) {
          staffGains.add('${sci.name} (+1 $primarySkill)');
        }
      }
    }

    // 3. Update research progress & level
    final currentItem = await db.researchDao.getResearchItem(corpName, researchType);
    var level = currentItem?.level ?? 0;
    var progress = (currentItem?.progress ?? 0) + rpGain;
    var nextGoal = (300 * pow(2, level)).round();
    var leveledUp = false;

    if (progress >= nextGoal) {
      progress -= nextGoal;
      level++;
      nextGoal = (300 * pow(2, level)).round();
      leveledUp = true;
    }

    await db.researchDao.upsertResearch(corpName, researchType, level, progress, nextGoal);

    return ResearchCycleResult(
      techKey: researchType,
      techName: techInfo.name,
      rpGained: rpGain,
      newLevel: level,
      currentProgress: progress,
      nextGoal: nextGoal,
      leveledUp: leveledUp,
      staffGains: staffGains,
    );
  }

  int _getOfficerSkill(CrewMember c, String skillName) {
    switch (skillName) {
      case 'Leadership':
        return c.leadership;
      case 'Influence':
        return c.influence;
      case 'Pilot':
        return c.pilot;
      case 'Computation':
        return c.computation;
      case 'Repair':
        return c.repair;
      case 'ShipWeapons':
        return c.shipWeapons;
      case 'Fighting':
        return c.fighting;
      case 'Athletics':
        return c.athletics;
      default:
        return c.computation;
    }
  }
}

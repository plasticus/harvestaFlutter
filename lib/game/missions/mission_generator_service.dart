import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';

class MissionContract {
  final int id;
  final String type;
  final double distance;
  final int cr;
  final int payout;
  final String bonus;
  final int bonusAmt;
  final String narrative;
  final int fuelCost;

  const MissionContract({
    required this.id,
    required this.type,
    required this.distance,
    required this.cr,
    required this.payout,
    required this.bonus,
    required this.bonusAmt,
    required this.narrative,
    required this.fuelCost,
  });
}

class MissionGeneratorService {
  final AppDatabase db;
  final Random rng;

  MissionGeneratorService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  static const List<String> missionTypes = [
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

  static const List<String> resourceBonuses = [
    'Life Support Gases',
    'Fuel Gases',
    'Conductive Metals',
    'Zero-G Construction Metals',
    'Surface Construction Metals',
    'Other Valuable Elements',
    'Water Ice',
  ];

  /// Calculates fuel transit cost in Solars based on AU distance and Astrogation research
  Future<int> calculateFuelCost(String corpName, double distance) async {
    final astroTech = await db.researchDao.getResearchItem(corpName, 'astrogation');
    final astroLevel = astroTech?.level ?? 0;
    final discount = min(0.20, astroLevel * 0.04);
    const baseRatePerAU = 1200;
    final rawCost = (distance * baseRatePerAU).round();
    return max(100, (rawCost * (1.0 - discount)).round());
  }

  /// Generates a set of 5 available mission contracts for the current game turn
  Future<List<MissionContract>> generateMissions(String corpName, int turn) async {
    // Check if missions already exist for current turn
    final existing = await (db.select(db.missionHolder)
          ..where((m) => m.corpName.equals(corpName) & m.gameTurn.equals(turn)))
        .get();

    if (existing.isNotEmpty) {
      final list = <MissionContract>[];
      for (final m in existing) {
        final fuel = await calculateFuelCost(corpName, m.distance);
        list.add(
          MissionContract(
            id: m.id,
            type: m.type ?? 'Operation',
            distance: m.distance,
            cr: m.cr,
            payout: m.payout,
            bonus: m.bonus,
            bonusAmt: m.bonusAmt,
            narrative: m.textContent ?? 'Standard corporate contract.',
            fuelCost: fuel,
          ),
        );
      }
      return list;
    }

    final created = <MissionContract>[];

    for (var i = 0; i < 5; i++) {
      final type = missionTypes[rng.nextInt(missionTypes.length)];
      final distance = (rng.nextInt(581) + 20) / 100.0; // 0.20 to 6.00 AU
      final cr = rng.nextInt(3) + 1; // CR 1 to 3
      final payout = rng.nextInt(70001) + 180000 + (distance * 3000).round() + (cr * 5000);

      final narrative = _generateNarrative(type, distance, cr, payout);

      final bonusRoll = rng.nextInt(3);
      String bonus;
      int bonusAmt;

      if (bonusRoll == 0) {
        bonus = 'Solars';
        bonusAmt = (rng.nextInt(8) + 8) * 1000;
      } else if (bonusRoll == 1) {
        bonus = 'a highly prospected cadet';
        bonusAmt = 1;
      } else {
        final res = resourceBonuses[rng.nextInt(resourceBonuses.length)];
        bonus = 'm³ $res';
        bonusAmt = rng.nextInt(151) + 50;
      }

      final fuelCost = await calculateFuelCost(corpName, distance);

      final id = await db.into(db.missionHolder).insert(
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
              resultFail: const Value(''),
              resultPass: const Value(''),
            ),
          );

      created.add(
        MissionContract(
          id: id,
          type: type,
          distance: distance,
          cr: cr,
          payout: payout,
          bonus: bonus,
          bonusAmt: bonusAmt,
          narrative: narrative,
          fuelCost: fuelCost,
        ),
      );
    }

    return created;
  }

  String _generateNarrative(String type, double distance, int cr, int payout) {
    switch (type) {
      case 'Transport':
        return 'High-priority cargo shipment required across ${distance.toStringAsFixed(2)} AU. Maintain sublight transit corridors and deliver safely to orbital staging hub.';
      case 'Attack':
        return 'Hostile pirate strike group detected at threat index CR-$cr. Intercept and neutralize enemy formation to secure corporate supply lines.';
      case 'Patrol':
        return 'Routine security sweeps along high-traffic asteroid belt shipping lanes ($distance AU). Deter pirate ambushes and report anomalies.';
      case 'Mine':
        return 'Mining escort detail for survey operations. Safeguard extraction freighters against rogue scavengers and belt raiders.';
      case 'Salvage':
        return 'Deep-space derelict vessel detected drifting at ${distance.toStringAsFixed(2)} AU. Investigate wreckage, secure black box, and extract scrap materials.';
      case 'Espionage':
        return 'Clandestine electronic reconnaissance mission. Probe rival orbital array communications while maintaining cloaked stealth signatures.';
      case 'Research':
        return 'Scientific field expedition to scan high-density gravitational anomalies. Protect survey scientists and gather telemetry.';
      case 'Diplomatic':
        return 'Executive envoy escort to neutral station summit. Provide heavy security escort across disputed belt sectors.';
      case 'Bounty':
        return 'Authorized bounty contract: track down and eliminate fugitive pirate commander operating in outer belt territory.';
      default:
        return 'Corporate operational assignment: complete waypoint transit and fulfill contract objectives.';
    }
  }
}

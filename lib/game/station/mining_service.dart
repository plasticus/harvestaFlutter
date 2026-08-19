import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';

class MiningResult {
  final String asteroidName;
  final String squadron;
  final int extractedM3;
  final int totalYieldM3;
  final Map<String, int> yields;
  final int remainingM3;
  final double efficiency;
  final bool fullyDepleted;

  const MiningResult({
    required this.asteroidName,
    required this.squadron,
    required this.extractedM3,
    required this.totalYieldM3,
    required this.yields,
    required this.remainingM3,
    required this.efficiency,
    required this.fullyDepleted,
  });
}

class MiningService {
  final AppDatabase db;

  MiningService(this.db);

  static const Map<int, double> miningLossMap = {
    0: 0.50,
    1: 0.45,
    2: 0.40,
    3: 0.35,
    4: 0.25,
    5: 0.15,
  };

  /// Calculates total hauling capacity for a fleet squadron including Hangar & Bay tech perks.
  Future<int> calculateSquadronCapacity(String corpName, String squadron) async {
    final ships = await db.fleetDao.getSquadronShips(corpName, squadron);
    if (ships.isEmpty) return 0;

    final rawCapacity = ships.fold<int>(0, (sum, s) => sum + (s.cargo * s.shipSize));

    final bayTech = await db.researchDao.getResearchItem(corpName, 'shipBay');
    final bayLevel = bayTech?.level ?? 0;

    if (bayLevel > 0) {
      return (rawCapacity * (1.0 + (bayLevel * 0.05))).round();
    }
    return rawCapacity;
  }

  /// Executes asteroid mineral extraction and refinery processing
  Future<MiningResult> executeMining({
    required String corpName,
    required String squadron,
    required String asteroidName,
  }) async {
    final squadronCapacity = await calculateSquadronCapacity(corpName, squadron);
    if (squadronCapacity <= 0) {
      throw StateError('Selected squadron "$squadron" has 0 m³ cargo capacity.');
    }

    final asteroid = await db.asteroidDao.getAsteroidByName(asteroidName);
    if (asteroid == null) {
      throw ArgumentError('Asteroid "$asteroidName" not found.');
    }

    // 1. Calculate refinery efficiency from asteroidMining research
    final miningTech = await db.researchDao.getResearchItem(corpName, 'asteroidMining');
    final miningLevel = miningTech?.level ?? 0;
    final lossPercent = miningLossMap[miningLevel] ?? 0.15;
    final efficiency = 1.0 - lossPercent;

    final totalM3 = asteroid.m3;
    final extracted = min(totalM3, squadronCapacity);
    final fraction = totalM3 > 0 ? (extracted / totalM3) : 0.0;

    // 2. Compute individual element yields
    final yields = <String, int>{
      'Surface Construction Metals': (asteroid.surfaceM * fraction * efficiency).round(),
      'Zero-G Construction Metals': (asteroid.zeroGM * fraction * efficiency).round(),
      'Conductive Metals': (asteroid.conductiveM * fraction * efficiency).round(),
      'Life Support Gases': (asteroid.lifeSuppG * fraction * efficiency).round(),
      'Fuel Gases': (asteroid.fuelG * fraction * efficiency).round(),
      'Other Valuable Elements': (asteroid.ove * fraction * efficiency).round(),
      'Water Ice': (asteroid.waterIce * fraction * efficiency).round(),
    };

    final totalYieldM3 = yields.values.fold<int>(0, (sum, y) => sum + y);

    // 3. Deposit yields into corp inventory
    for (final entry in yields.entries) {
      if (entry.value > 0) {
        await db.inventoryDao.adjustItemQuantity(corpName, entry.key, entry.value);
      }
    }

    // 4. Update or deplete asteroid
    final remainingM3 = max(0, totalM3 - extracted);
    final fullyDepleted = remainingM3 <= 0;

    if (!fullyDepleted) {
      final scaleDown = remainingM3 / totalM3;
      await (db.update(db.asteroids)..where((a) => a.asteroidName.equals(asteroidName))).write(
        AsteroidsCompanion(
          m3: Value(remainingM3),
          surfaceM: Value((asteroid.surfaceM * scaleDown).round()),
          zeroGM: Value((asteroid.zeroGM * scaleDown).round()),
          conductiveM: Value((asteroid.conductiveM * scaleDown).round()),
          lifeSuppG: Value((asteroid.lifeSuppG * scaleDown).round()),
          fuelG: Value((asteroid.fuelG * scaleDown).round()),
          ove: Value((asteroid.ove * scaleDown).round()),
          waterIce: Value((asteroid.waterIce * scaleDown).round()),
        ),
      );
    } else {
      // Remove from scanned catalog
      await (db.delete(db.asteroidsScanned)
            ..where((a) => a.corpName.equals(corpName) & a.asteroidName.equals(asteroidName)))
          .go();
      await (db.delete(db.tempAsteroidsScanned)
            ..where((a) => a.corpName.equals(corpName) & a.asteroidName.equals(asteroidName)))
          .go();
    }

    return MiningResult(
      asteroidName: asteroidName,
      squadron: squadron,
      extractedM3: extracted,
      totalYieldM3: totalYieldM3,
      yields: yields,
      remainingM3: remainingM3,
      efficiency: efficiency,
      fullyDepleted: fullyDepleted,
    );
  }
}

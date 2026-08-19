import 'dart:math';
import '../../data/app_database.dart';

class ScanSweepResult {
  final List<Asteroid> discoveredAsteroids;
  final int totalM3;
  final bool wasNewScan;
  final int scanLevel;
  final int? maxM3Filter;

  const ScanSweepResult({
    required this.discoveredAsteroids,
    required this.totalM3,
    required this.wasNewScan,
    required this.scanLevel,
    this.maxM3Filter,
  });
}

class ScanningService {
  final AppDatabase db;
  final Random rng;

  ScanningService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  /// Executes a long-range radar sweep of the asteroid belt for the corporation.
  Future<ScanSweepResult> executeRadarSweep(String corpName, int turn) async {
    // 1. Determine scanning research level
    final research = await db.researchDao.getResearchItem(corpName, 'asteroidScanning');
    final scanLevel = research?.level ?? 0;

    final asteroidsToScan = 2 + scanLevel;
    final maxM3 = (scanLevel >= 5) ? null : 200 * (scanLevel + 1);

    // 2. Fetch already scanned asteroid names
    final existingScanned = await db.asteroidDao.getScannedAsteroids(corpName);
    final scannedNames = existingScanned.map((a) => a.asteroidName).toSet();

    // 3. Query potential candidate asteroids from master catalog
    final allAsteroids = await db.select(db.asteroids).get();
    final candidates = allAsteroids.where((a) {
      if (scannedNames.contains(a.asteroidName)) return false;
      if (maxM3 != null && a.m3 > maxM3) return false;
      return true;
    }).toList();

    // Shuffle and pick
    candidates.shuffle(rng);
    final picked = <Asteroid>[];
    if (candidates.isNotEmpty) {
      picked.addAll(candidates.take(asteroidsToScan));
    } else {
      // If tier filter candidates are exhausted, survey next available belt targets
      final remainingUnscanned = allAsteroids.where((a) => !scannedNames.contains(a.asteroidName)).toList();
      if (remainingUnscanned.isNotEmpty) {
        remainingUnscanned.shuffle(rng);
        picked.addAll(remainingUnscanned.take(asteroidsToScan));
      } else if (allAsteroids.isNotEmpty) {
        final fallback = allAsteroids.toList()..shuffle(rng);
        picked.addAll(fallback.take(asteroidsToScan));
      }
    }

    // 4. Save to temp and permanent scanned tables
    await (db.delete(db.tempAsteroidsScanned)
          ..where((t) => t.corpName.equals(corpName)))
        .go();

    for (final ast in picked) {
      await db.into(db.tempAsteroidsScanned).insert(
            TempAsteroidsScannedCompanion.insert(
              corpName: corpName,
              asteroidName: ast.asteroidName,
              gameTurn: turn,
            ),
          );

      await db.into(db.asteroidsScanned).insert(
            AsteroidsScannedCompanion.insert(
              corpName: corpName,
              asteroidName: ast.asteroidName,
              gameTurn: turn,
            ),
          );
    }

    final totalM3 = picked.fold<int>(0, (sum, a) => sum + a.m3);

    return ScanSweepResult(
      discoveredAsteroids: picked,
      totalM3: totalM3,
      wasNewScan: true,
      scanLevel: scanLevel,
      maxM3Filter: maxM3,
    );
  }

  /// Gets current turn's active scan targets (or all scanned asteroids)
  Future<List<Asteroid>> getCurrentScannedAsteroids(String corpName) async {
    final tempEntries = await (db.select(db.tempAsteroidsScanned)
          ..where((t) => t.corpName.equals(corpName)))
        .get();

    if (tempEntries.isNotEmpty) {
      final names = tempEntries.map((t) => t.asteroidName).toSet();
      return (db.select(db.asteroids)..where((a) => a.asteroidName.isIn(names))).get();
    }

    // Fallback to all permanently scanned
    final perm = await db.asteroidDao.getScannedAsteroids(corpName);
    final permNames = perm.map((p) => p.asteroidName).toSet();
    return (db.select(db.asteroids)..where((a) => a.asteroidName.isIn(permNames))).get();
  }
}

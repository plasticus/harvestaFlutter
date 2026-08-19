import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/asteroids_table.dart';
import '../tables/asteroids_scanned_table.dart';
import '../tables/temp_asteroids_scanned_table.dart';

part 'asteroid_dao.g.dart';

@DriftAccessor(tables: [Asteroids, AsteroidsScanned, TempAsteroidsScanned])
class AsteroidDao extends DatabaseAccessor<AppDatabase> with _$AsteroidDaoMixin {
  AsteroidDao(super.db);

  Future<List<Asteroid>> getRandomAsteroids(int limit) =>
      (select(asteroids)..limit(limit)).get();

  Future<List<AsteroidScanned>> getScannedAsteroids(String corpName) =>
      (select(asteroidsScanned)..where((t) => t.corpName.equals(corpName))).get();

  Future<List<TempAsteroidScanned>> getTurnScannedAsteroids(String corpName, int turn) =>
      (select(tempAsteroidsScanned)
        ..where((t) => t.corpName.equals(corpName) & t.gameTurn.equals(turn))).get();

  Future<Asteroid?> getAsteroidByName(String name) =>
      (select(asteroids)..where((t) => t.asteroidName.equals(name))).getSingleOrNull();

  Future<void> updateAsteroidM3(String name, int newM3) async {
    if (newM3 <= 0) {
      await (delete(asteroids)..where((t) => t.asteroidName.equals(name))).go();
    } else {
      await (update(asteroids)..where((t) => t.asteroidName.equals(name)))
          .write(AsteroidsCompanion(m3: Value(newM3)));
    }
  }
}

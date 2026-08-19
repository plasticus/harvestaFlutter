import 'package:drift/drift.dart';

@DataClassName('AsteroidScanned')
class AsteroidsScanned extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameTurn => integer()();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
  TextColumn get asteroidName => text().withLength(min: 0, max: 50)();
}

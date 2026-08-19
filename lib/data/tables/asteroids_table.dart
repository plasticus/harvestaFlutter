import 'package:drift/drift.dart';

@DataClassName('Asteroid')
class Asteroids extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get asteroidName => text().withLength(min: 0, max: 50)();
  IntColumn get m3 => integer().withDefault(const Constant(0))();
  IntColumn get surfaceM => integer().withDefault(const Constant(0))();
  IntColumn get zeroGM => integer().withDefault(const Constant(0))();
  IntColumn get conductiveM => integer().withDefault(const Constant(0))();
  IntColumn get lifeSuppG => integer().withDefault(const Constant(0))();
  IntColumn get fuelG => integer().withDefault(const Constant(0))();
  IntColumn get ove => integer().withDefault(const Constant(0))();
  IntColumn get waterIce => integer().withDefault(const Constant(0))();
}

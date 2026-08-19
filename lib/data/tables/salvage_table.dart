import 'package:drift/drift.dart';

@DataClassName('SalvageEntry')
class Salvage extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get salvageName => text().withLength(min: 0, max: 100)();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
  IntColumn get m3 => integer().withDefault(const Constant(0))();
  IntColumn get surfaceM => integer().withDefault(const Constant(0))();
  IntColumn get zeroGM => integer().withDefault(const Constant(0))();
  IntColumn get conductiveM => integer().withDefault(const Constant(0))();
  IntColumn get lifeSuppG => integer().withDefault(const Constant(0))();
  IntColumn get fuelG => integer().withDefault(const Constant(0))();
  IntColumn get ove => integer().withDefault(const Constant(0))();
  IntColumn get waterIce => integer().withDefault(const Constant(0))();
}

import 'package:drift/drift.dart';

@DataClassName('ShipMod')
class ShipMods extends Table {
  IntColumn get modId => integer().autoIncrement()();
  TextColumn get shipName => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get modType => text().withLength(min: 0, max: 20).nullable()();
  TextColumn get modName => text().withLength(min: 0, max: 50).nullable()();
  IntColumn get power => integer().withDefault(const Constant(0))();
}

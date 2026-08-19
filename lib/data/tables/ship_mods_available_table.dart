import 'package:drift/drift.dart';

@DataClassName('ShipModAvailable')
class ShipModsAvailable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get modType => text().withLength(min: 0, max: 20).nullable()();
  TextColumn get modName => text().withLength(min: 0, max: 50)();
  IntColumn get power => integer().withDefault(const Constant(0))();
  IntColumn get price => integer().withDefault(const Constant(0))();
}

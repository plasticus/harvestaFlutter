import 'package:drift/drift.dart';

@DataClassName('ShipPersonality')
class ShipPersonalities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get shipName => text().withLength(min: 0, max: 50)();
  TextColumn get personality => text().withLength(min: 0, max: 50)();
  IntColumn get level => integer().withDefault(const Constant(1))();
}

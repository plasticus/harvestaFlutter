import 'package:drift/drift.dart';

@DataClassName('FleetShip')
class Fleet extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65).nullable()();
  TextColumn get squadron => text().withLength(min: 0, max: 50).withDefault(const Constant('Squadron 1'))();
  TextColumn get shipName => text().withLength(min: 0, max: 50)();
  TextColumn get shipClass => text().withLength(min: 0, max: 50).nullable()();
  IntColumn get shipSize => integer().withDefault(const Constant(1))();
  TextColumn get shipModel => text().withLength(min: 0, max: 50).nullable()();
  IntColumn get weap => integer().withDefault(const Constant(0))();
  IntColumn get armor => integer().withDefault(const Constant(0))();
  IntColumn get bays => integer().withDefault(const Constant(0))();
  IntColumn get cargo => integer().withDefault(const Constant(0))();
  IntColumn get engines => integer().withDefault(const Constant(0))();
  IntColumn get maneuv => integer().withDefault(const Constant(0))();
  IntColumn get weapCtrl => integer().withDefault(const Constant(0))();
  IntColumn get cloak => integer().withDefault(const Constant(0))();
  IntColumn get lifeSupp => integer().withDefault(const Constant(0))();
  IntColumn get maxCargo => integer().withDefault(const Constant(0))();
  IntColumn get maxEngines => integer().withDefault(const Constant(0))();
  IntColumn get maxManeuv => integer().withDefault(const Constant(0))();
  IntColumn get maxWeapCtrl => integer().withDefault(const Constant(0))();
  IntColumn get maxLifeSupp => integer().withDefault(const Constant(0))();
  IntColumn get hp => integer().withDefault(const Constant(100))();
  IntColumn get maxHp => integer().withDefault(const Constant(100))();
  IntColumn get value => integer().withDefault(const Constant(0))();
  IntColumn get maxShipValue => integer().withDefault(const Constant(0))();
}

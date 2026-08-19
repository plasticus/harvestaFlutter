import 'package:drift/drift.dart';

@DataClassName('Cadet')
class Cadets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65).nullable()();
  TextColumn get name => text().withLength(min: 0, max: 100)();
  TextColumn get status => text().withLength(min: 0, max: 30).withDefault(const Constant('Available'))();
  IntColumn get leadership => integer().withDefault(const Constant(0))();
  IntColumn get influence => integer().withDefault(const Constant(0))();
  IntColumn get pilot => integer().withDefault(const Constant(0))();
  IntColumn get computation => integer().withDefault(const Constant(0))();
  IntColumn get repair => integer().withDefault(const Constant(0))();
  IntColumn get shipWeapons => integer().withDefault(const Constant(0))();
  IntColumn get firearms => integer().withDefault(const Constant(0))();
  IntColumn get melee => integer().withDefault(const Constant(0))();
  IntColumn get athletics => integer().withDefault(const Constant(0))();
  TextColumn get gender => text().nullable()();
  TextColumn get nationality => text().nullable()();
}

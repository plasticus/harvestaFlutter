import 'package:drift/drift.dart';

@DataClassName('CrewMember')
class Crew extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65).nullable()();
  TextColumn get squadron => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get shipName => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get assignment => text().withLength(min: 0, max: 50).withDefault(const Constant('Unassigned'))();
  TextColumn get status => text().withLength(min: 0, max: 30).withDefault(const Constant('Active'))();
  TextColumn get name => text().withLength(min: 0, max: 100)();
  IntColumn get leadership => integer().withDefault(const Constant(0))();
  IntColumn get influence => integer().withDefault(const Constant(0))();
  IntColumn get pilot => integer().withDefault(const Constant(0))();
  IntColumn get computation => integer().withDefault(const Constant(0))();
  IntColumn get repair => integer().withDefault(const Constant(0))();
  IntColumn get shipWeapons => integer().withDefault(const Constant(0))();
  IntColumn get fighting => integer().withDefault(const Constant(0))();
  IntColumn get athletics => integer().withDefault(const Constant(0))();
}

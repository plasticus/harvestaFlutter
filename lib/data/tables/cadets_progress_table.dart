import 'package:drift/drift.dart';

@DataClassName('CadetProgress')
class CadetsProgress extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameTurn => integer()();
  IntColumn get cadetId => integer().nullable()();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
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

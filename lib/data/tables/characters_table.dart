import 'package:drift/drift.dart';

@DataClassName('GameCharacter')
class Characters extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cid => integer().nullable()();
  TextColumn get corp => text().withLength(min: 0, max: 65).nullable()();
  TextColumn get name => text().withLength(min: 0, max: 100)();
  TextColumn get race => text().withLength(min: 0, max: 50).nullable()();
  IntColumn get leadership => integer().withDefault(const Constant(0))();
  IntColumn get influence => integer().withDefault(const Constant(0))();
  IntColumn get pilot => integer().withDefault(const Constant(0))();
  IntColumn get astrogation => integer().withDefault(const Constant(0))();
  IntColumn get computation => integer().withDefault(const Constant(0))();
  IntColumn get repair => integer().withDefault(const Constant(0))();
  IntColumn get shipWeapons => integer().withDefault(const Constant(0))();
  IntColumn get firearms => integer().withDefault(const Constant(0))();
  IntColumn get melee => integer().withDefault(const Constant(0))();
  IntColumn get athletics => integer().withDefault(const Constant(0))();
}

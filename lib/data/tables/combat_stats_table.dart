import 'package:drift/drift.dart';

@DataClassName('CombatStat')
class CombatStats extends Table {
  IntColumn get attackId => integer().autoIncrement()();
  IntColumn get battleId => integer().nullable()();
  TextColumn get attackSquadron => text().withLength(min: 0, max: 50)();
  TextColumn get attacker => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get weapon => text().withLength(min: 0, max: 50).nullable()();
  IntColumn get damage => integer().withDefault(const Constant(0))();
  TextColumn get target => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get destroyed => text().withLength(min: 0, max: 5).nullable()();
}

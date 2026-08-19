import 'package:drift/drift.dart';

@DataClassName('MissionInterruptorEntry')
class MissionInterruptors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().withLength(min: 0, max: 50).nullable()();
  RealColumn get distance => real().nullable()();
  IntColumn get cr => integer().withDefault(const Constant(1))();
  TextColumn get openingText => text().nullable()();
  TextColumn get textContent => text().named('text').nullable()();
  TextColumn get resultFail => text().nullable()();
  TextColumn get resultPass => text().nullable()();
}

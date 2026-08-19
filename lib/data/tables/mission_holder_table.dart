import 'package:drift/drift.dart';

@DataClassName('MissionHolderEntry')
class MissionHolder extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65).nullable()();
  IntColumn get gameTurn => integer().nullable()();
  TextColumn get type => text().withLength(min: 0, max: 50).nullable()();
  RealColumn get distance => real().withDefault(const Constant(1.0))();
  IntColumn get cr => integer().withDefault(const Constant(1))();
  IntColumn get payout => integer().withDefault(const Constant(0))();
  TextColumn get bonus => text().withLength(min: 0, max: 50).withDefault(const Constant(''))();
  IntColumn get bonusAmt => integer().withDefault(const Constant(0))();
  TextColumn get textContent => text().named('text').nullable()();
  TextColumn get resultFail => text().nullable()();
  TextColumn get resultPass => text().nullable()();
}

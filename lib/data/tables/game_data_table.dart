import 'package:drift/drift.dart';

@DataClassName('GameDataEntry')
class GameData extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameTurn => integer().withDefault(const Constant(1))();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

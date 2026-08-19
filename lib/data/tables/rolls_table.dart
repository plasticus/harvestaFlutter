import 'package:drift/drift.dart';

@DataClassName('Roll')
class Rolls extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get die => integer()();
  IntColumn get value => integer()();
  TextColumn get user => text().withLength(min: 0, max: 65)();
  TextColumn get quest => text().withLength(min: 0, max: 100)();
  DateTimeColumn get stamp => dateTime().withDefault(currentDateAndTime)();
}

import 'package:drift/drift.dart';

@DataClassName('Member')
class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().withLength(min: 0, max: 65)();
  TextColumn get password => text().withLength(min: 0, max: 65).withDefault(const Constant(''))();
  TextColumn get email => text().withLength(min: 0, max: 100).withDefault(const Constant(''))();
  BoolColumn get verified => boolean().withDefault(const Constant(true))();
  BoolColumn get isAi => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

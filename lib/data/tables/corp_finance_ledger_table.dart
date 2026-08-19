import 'package:drift/drift.dart';

@DataClassName('CorpFinanceLedgerEntry')
class CorpFinanceLedger extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
  IntColumn get gameTurn => integer()();
  IntColumn get netWorth => integer().withDefault(const Constant(0))();
  IntColumn get solars => integer().withDefault(const Constant(0))();
  IntColumn get fleetVal => integer().withDefault(const Constant(0))();
  IntColumn get materialsVal => integer().withDefault(const Constant(0))();
  IntColumn get revenue => integer().withDefault(const Constant(0))();
  IntColumn get expenses => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
}

import 'package:drift/drift.dart';

@DataClassName('CrewGenerateEntry')
class CrewGenerate extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nationality => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get gender => text().withLength(min: 0, max: 20).nullable()();
  TextColumn get forename => text().withLength(min: 0, max: 50).nullable()();
  TextColumn get surname => text().withLength(min: 0, max: 50).nullable()();
}

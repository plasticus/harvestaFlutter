import 'package:drift/drift.dart';

@DataClassName('CorpResearchItem')
class CorpResearch extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
  TextColumn get researchType => text().withLength(min: 0, max: 50)();
  IntColumn get level => integer().withDefault(const Constant(0))();
  IntColumn get progress => integer().withDefault(const Constant(0))();
  IntColumn get nextGoal => integer().withDefault(const Constant(300))();
}

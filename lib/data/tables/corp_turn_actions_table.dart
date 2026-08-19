import 'package:drift/drift.dart';

@DataClassName('CorpTurnAction')
class CorpTurnActions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
  IntColumn get gameTurn => integer()();
  BoolColumn get scanDone => boolean().withDefault(const Constant(false))();
  BoolColumn get mineDone => boolean().withDefault(const Constant(false))();
  BoolColumn get researchDone => boolean().withDefault(const Constant(false))();
  BoolColumn get cadetsDone => boolean().withDefault(const Constant(false))();
  BoolColumn get expeditionDone => boolean().withDefault(const Constant(false))();
  BoolColumn get marketDone => boolean().withDefault(const Constant(false))();
}

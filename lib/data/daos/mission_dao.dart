import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/mission_holder_table.dart';
import '../tables/mission_interruptors_table.dart';

part 'mission_dao.g.dart';

@DriftAccessor(tables: [MissionHolder, MissionInterruptors])
class MissionDao extends DatabaseAccessor<AppDatabase> with _$MissionDaoMixin {
  MissionDao(super.db);

  Future<List<MissionHolderEntry>> getMissionsForTurn(String corpName, int turn) =>
      (select(missionHolder)
        ..where((t) => t.corpName.equals(corpName) & t.gameTurn.equals(turn))).get();

  Future<List<MissionInterruptorEntry>> getAllInterruptors() =>
      select(missionInterruptors).get();

  Future<void> clearOldMissions(String corpName, int turn) =>
      (delete(missionHolder)
        ..where((t) => t.corpName.equals(corpName) & t.gameTurn.isSmallerThanValue(turn))).go();
}

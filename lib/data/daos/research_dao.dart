import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/corp_research_table.dart';

part 'research_dao.g.dart';

@DriftAccessor(tables: [CorpResearch])
class ResearchDao extends DatabaseAccessor<AppDatabase> with _$ResearchDaoMixin {
  ResearchDao(super.db);

  Future<List<CorpResearchItem>> getCorpResearch(String corpName) =>
      (select(corpResearch)..where((t) => t.corpName.equals(corpName))).get();

  Future<CorpResearchItem?> getResearchItem(String corpName, String researchType) =>
      (select(corpResearch)
        ..where((t) => t.corpName.equals(corpName) & t.researchType.equals(researchType)))
          .getSingleOrNull();

  Future<void> upsertResearch(String corpName, String type, int level, int progress, int nextGoal) async {
    final existing = await getResearchItem(corpName, type);
    if (existing == null) {
      await into(corpResearch).insert(CorpResearchCompanion.insert(
        corpName: corpName,
        researchType: type,
        level: Value(level),
        progress: Value(progress),
        nextGoal: Value(nextGoal),
      ));
    } else {
      await (update(corpResearch)..where((t) => t.id.equals(existing.id))).write(
        CorpResearchCompanion(
          level: Value(level),
          progress: Value(progress),
          nextGoal: Value(nextGoal),
        ),
      );
    }
  }
}

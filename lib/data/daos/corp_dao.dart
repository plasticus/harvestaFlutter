import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/members_table.dart';

part 'corp_dao.g.dart';

@DriftAccessor(tables: [Members])
class CorpDao extends DatabaseAccessor<AppDatabase> with _$CorpDaoMixin {
  CorpDao(super.db);

  Future<List<Member>> getAllCorps() => select(members).get();

  Future<Member?> getCorpByName(String username) =>
      (select(members)..where((t) => t.username.equals(username))).getSingleOrNull();

  Future<int> createCorp(String username, {bool isAi = false, bool verified = true}) {
    return into(members).insert(MembersCompanion.insert(
      username: username,
      isAi: Value(isAi),
      verified: Value(verified),
    ));
  }
}

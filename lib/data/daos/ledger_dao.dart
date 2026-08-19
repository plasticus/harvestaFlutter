import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/corp_turn_actions_table.dart';
import '../tables/corp_finance_ledger_table.dart';

part 'ledger_dao.g.dart';

@DriftAccessor(tables: [CorpTurnActions, CorpFinanceLedger])
class LedgerDao extends DatabaseAccessor<AppDatabase> with _$LedgerDaoMixin {
  LedgerDao(super.db);

  Future<CorpTurnAction?> getTurnActions(String corpName, int turn) =>
      (select(corpTurnActions)
        ..where((t) => t.corpName.equals(corpName) & t.gameTurn.equals(turn))).getSingleOrNull();

  Future<void> recordTurnAction(String corpName, int turn, CorpTurnActionsCompanion action) async {
    final existing = await getTurnActions(corpName, turn);
    if (existing == null) {
      await into(corpTurnActions).insert(action);
    } else {
      await (update(corpTurnActions)..where((t) => t.id.equals(existing.id))).write(action);
    }
  }

  Future<List<CorpFinanceLedgerEntry>> getLedgerHistory(String corpName) =>
      (select(corpFinanceLedger)
        ..where((t) => t.corpName.equals(corpName))
        ..orderBy([(t) => OrderingTerm.asc(t.gameTurn)])).get();

  Future<void> recordLedgerEntry(CorpFinanceLedgerCompanion entry) async {
    final corp = entry.corpName.value;
    final turn = entry.gameTurn.value;
    final existing = await (select(corpFinanceLedger)
      ..where((t) => t.corpName.equals(corp) & t.gameTurn.equals(turn))).getSingleOrNull();

    if (existing == null) {
      await into(corpFinanceLedger).insert(entry);
    } else {
      await (update(corpFinanceLedger)..where((t) => t.id.equals(existing.id))).write(entry);
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_dao.dart';

// ignore_for_file: type=lint
mixin _$LedgerDaoMixin on DatabaseAccessor<AppDatabase> {
  $CorpTurnActionsTable get corpTurnActions => attachedDatabase.corpTurnActions;
  $CorpFinanceLedgerTable get corpFinanceLedger =>
      attachedDatabase.corpFinanceLedger;
  LedgerDaoManager get managers => LedgerDaoManager(this);
}

class LedgerDaoManager {
  final _$LedgerDaoMixin _db;
  LedgerDaoManager(this._db);
  $$CorpTurnActionsTableTableManager get corpTurnActions =>
      $$CorpTurnActionsTableTableManager(
        _db.attachedDatabase,
        _db.corpTurnActions,
      );
  $$CorpFinanceLedgerTableTableManager get corpFinanceLedger =>
      $$CorpFinanceLedgerTableTableManager(
        _db.attachedDatabase,
        _db.corpFinanceLedger,
      );
}

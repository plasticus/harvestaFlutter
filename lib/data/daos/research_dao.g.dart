// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_dao.dart';

// ignore_for_file: type=lint
mixin _$ResearchDaoMixin on DatabaseAccessor<AppDatabase> {
  $CorpResearchTable get corpResearch => attachedDatabase.corpResearch;
  ResearchDaoManager get managers => ResearchDaoManager(this);
}

class ResearchDaoManager {
  final _$ResearchDaoMixin _db;
  ResearchDaoManager(this._db);
  $$CorpResearchTableTableManager get corpResearch =>
      $$CorpResearchTableTableManager(_db.attachedDatabase, _db.corpResearch);
}

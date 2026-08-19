// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corp_dao.dart';

// ignore_for_file: type=lint
mixin _$CorpDaoMixin on DatabaseAccessor<AppDatabase> {
  $MembersTable get members => attachedDatabase.members;
  CorpDaoManager get managers => CorpDaoManager(this);
}

class CorpDaoManager {
  final _$CorpDaoMixin _db;
  CorpDaoManager(this._db);
  $$MembersTableTableManager get members =>
      $$MembersTableTableManager(_db.attachedDatabase, _db.members);
}

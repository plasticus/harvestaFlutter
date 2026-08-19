// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_dao.dart';

// ignore_for_file: type=lint
mixin _$CrewDaoMixin on DatabaseAccessor<AppDatabase> {
  $CrewTable get crew => attachedDatabase.crew;
  $CadetsTable get cadets => attachedDatabase.cadets;
  $CadetsProgressTable get cadetsProgress => attachedDatabase.cadetsProgress;
  CrewDaoManager get managers => CrewDaoManager(this);
}

class CrewDaoManager {
  final _$CrewDaoMixin _db;
  CrewDaoManager(this._db);
  $$CrewTableTableManager get crew =>
      $$CrewTableTableManager(_db.attachedDatabase, _db.crew);
  $$CadetsTableTableManager get cadets =>
      $$CadetsTableTableManager(_db.attachedDatabase, _db.cadets);
  $$CadetsProgressTableTableManager get cadetsProgress =>
      $$CadetsProgressTableTableManager(
        _db.attachedDatabase,
        _db.cadetsProgress,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_data_dao.dart';

// ignore_for_file: type=lint
mixin _$GameDataDaoMixin on DatabaseAccessor<AppDatabase> {
  $GameDataTable get gameData => attachedDatabase.gameData;
  GameDataDaoManager get managers => GameDataDaoManager(this);
}

class GameDataDaoManager {
  final _$GameDataDaoMixin _db;
  GameDataDaoManager(this._db);
  $$GameDataTableTableManager get gameData =>
      $$GameDataTableTableManager(_db.attachedDatabase, _db.gameData);
}

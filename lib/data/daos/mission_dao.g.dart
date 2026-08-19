// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission_dao.dart';

// ignore_for_file: type=lint
mixin _$MissionDaoMixin on DatabaseAccessor<AppDatabase> {
  $MissionHolderTable get missionHolder => attachedDatabase.missionHolder;
  $MissionInterruptorsTable get missionInterruptors =>
      attachedDatabase.missionInterruptors;
  MissionDaoManager get managers => MissionDaoManager(this);
}

class MissionDaoManager {
  final _$MissionDaoMixin _db;
  MissionDaoManager(this._db);
  $$MissionHolderTableTableManager get missionHolder =>
      $$MissionHolderTableTableManager(_db.attachedDatabase, _db.missionHolder);
  $$MissionInterruptorsTableTableManager get missionInterruptors =>
      $$MissionInterruptorsTableTableManager(
        _db.attachedDatabase,
        _db.missionInterruptors,
      );
}

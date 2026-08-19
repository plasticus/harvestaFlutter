// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_dao.dart';

// ignore_for_file: type=lint
mixin _$StationDaoMixin on DatabaseAccessor<AppDatabase> {
  $StationBuildingsTable get stationBuildings =>
      attachedDatabase.stationBuildings;
  StationDaoManager get managers => StationDaoManager(this);
}

class StationDaoManager {
  final _$StationDaoMixin _db;
  StationDaoManager(this._db);
  $$StationBuildingsTableTableManager get stationBuildings =>
      $$StationBuildingsTableTableManager(
        _db.attachedDatabase,
        _db.stationBuildings,
      );
}

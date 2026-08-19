// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_dao.dart';

// ignore_for_file: type=lint
mixin _$FleetDaoMixin on DatabaseAccessor<AppDatabase> {
  $FleetTable get fleet => attachedDatabase.fleet;
  $ShipModsTable get shipMods => attachedDatabase.shipMods;
  $ShipPersonalitiesTable get shipPersonalities =>
      attachedDatabase.shipPersonalities;
  FleetDaoManager get managers => FleetDaoManager(this);
}

class FleetDaoManager {
  final _$FleetDaoMixin _db;
  FleetDaoManager(this._db);
  $$FleetTableTableManager get fleet =>
      $$FleetTableTableManager(_db.attachedDatabase, _db.fleet);
  $$ShipModsTableTableManager get shipMods =>
      $$ShipModsTableTableManager(_db.attachedDatabase, _db.shipMods);
  $$ShipPersonalitiesTableTableManager get shipPersonalities =>
      $$ShipPersonalitiesTableTableManager(
        _db.attachedDatabase,
        _db.shipPersonalities,
      );
}

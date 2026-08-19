// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_dao.dart';

// ignore_for_file: type=lint
mixin _$CatalogDaoMixin on DatabaseAccessor<AppDatabase> {
  $ShipModelsTable get shipModels => attachedDatabase.shipModels;
  $ShipModsAvailableTable get shipModsAvailable =>
      attachedDatabase.shipModsAvailable;
  $ScavengeListTable get scavengeList => attachedDatabase.scavengeList;
  CatalogDaoManager get managers => CatalogDaoManager(this);
}

class CatalogDaoManager {
  final _$CatalogDaoMixin _db;
  CatalogDaoManager(this._db);
  $$ShipModelsTableTableManager get shipModels =>
      $$ShipModelsTableTableManager(_db.attachedDatabase, _db.shipModels);
  $$ShipModsAvailableTableTableManager get shipModsAvailable =>
      $$ShipModsAvailableTableTableManager(
        _db.attachedDatabase,
        _db.shipModsAvailable,
      );
  $$ScavengeListTableTableManager get scavengeList =>
      $$ScavengeListTableTableManager(_db.attachedDatabase, _db.scavengeList);
}

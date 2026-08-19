// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_dao.dart';

// ignore_for_file: type=lint
mixin _$InventoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $CorpInventoryTable get corpInventory => attachedDatabase.corpInventory;
  InventoryDaoManager get managers => InventoryDaoManager(this);
}

class InventoryDaoManager {
  final _$InventoryDaoMixin _db;
  InventoryDaoManager(this._db);
  $$CorpInventoryTableTableManager get corpInventory =>
      $$CorpInventoryTableTableManager(_db.attachedDatabase, _db.corpInventory);
}

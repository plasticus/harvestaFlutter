// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asteroid_dao.dart';

// ignore_for_file: type=lint
mixin _$AsteroidDaoMixin on DatabaseAccessor<AppDatabase> {
  $AsteroidsTable get asteroids => attachedDatabase.asteroids;
  $AsteroidsScannedTable get asteroidsScanned =>
      attachedDatabase.asteroidsScanned;
  $TempAsteroidsScannedTable get tempAsteroidsScanned =>
      attachedDatabase.tempAsteroidsScanned;
  AsteroidDaoManager get managers => AsteroidDaoManager(this);
}

class AsteroidDaoManager {
  final _$AsteroidDaoMixin _db;
  AsteroidDaoManager(this._db);
  $$AsteroidsTableTableManager get asteroids =>
      $$AsteroidsTableTableManager(_db.attachedDatabase, _db.asteroids);
  $$AsteroidsScannedTableTableManager get asteroidsScanned =>
      $$AsteroidsScannedTableTableManager(
        _db.attachedDatabase,
        _db.asteroidsScanned,
      );
  $$TempAsteroidsScannedTableTableManager get tempAsteroidsScanned =>
      $$TempAsteroidsScannedTableTableManager(
        _db.attachedDatabase,
        _db.tempAsteroidsScanned,
      );
}

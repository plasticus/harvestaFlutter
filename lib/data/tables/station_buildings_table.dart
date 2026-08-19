import 'package:drift/drift.dart';

@DataClassName('StationBuilding')
class StationBuildings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65).nullable()();
  TextColumn get stationName => text().withLength(min: 0, max: 65)();
  TextColumn get buildingType => text().withLength(min: 0, max: 50)();
  TextColumn get buildingName => text().withLength(min: 0, max: 50).nullable()();
  IntColumn get power => integer().withDefault(const Constant(1))();
  IntColumn get level => integer().withDefault(const Constant(1))();
}

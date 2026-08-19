import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/station_buildings_table.dart';

part 'station_dao.g.dart';

@DriftAccessor(tables: [StationBuildings])
class StationDao extends DatabaseAccessor<AppDatabase> with _$StationDaoMixin {
  StationDao(super.db);

  Future<List<StationBuilding>> getBuildings(String corpName) =>
      (select(stationBuildings)..where((t) => t.corpName.equals(corpName))).get();

  Future<StationBuilding?> getBuilding(String corpName, String buildingType) =>
      (select(stationBuildings)
        ..where((t) => t.corpName.equals(corpName) & t.buildingType.equals(buildingType)))
          .getSingleOrNull();

  Future<void> upgradeBuilding(String corpName, String buildingType) async {
    final building = await getBuilding(corpName, buildingType);
    if (building != null) {
      await (update(stationBuildings)..where((t) => t.id.equals(building.id)))
          .write(StationBuildingsCompanion(level: Value(building.level + 1)));
    }
  }
}

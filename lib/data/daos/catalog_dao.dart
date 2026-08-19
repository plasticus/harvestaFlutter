import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/ship_models_table.dart';
import '../tables/ship_mods_available_table.dart';
import '../tables/scavenge_list_table.dart';

part 'catalog_dao.g.dart';

@DriftAccessor(tables: [ShipModels, ShipModsAvailable, ScavengeList])
class CatalogDao extends DatabaseAccessor<AppDatabase> with _$CatalogDaoMixin {
  CatalogDao(super.db);

  Future<List<ShipModelEntry>> getAllShipModels() => select(shipModels).get();

  Future<ShipModelEntry?> getShipModel(String model) =>
      (select(shipModels)..where((t) => t.model.equals(model))).getSingleOrNull();

  Future<List<ShipModAvailable>> getAllAvailableMods() => select(shipModsAvailable).get();

  Future<List<ScavengeListEntry>> getAllScavengeItems() => select(scavengeList).get();
}

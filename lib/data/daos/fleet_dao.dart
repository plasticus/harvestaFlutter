import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/fleet_table.dart';
import '../tables/ship_mods_table.dart';
import '../tables/ship_personalities_table.dart';

part 'fleet_dao.g.dart';

@DriftAccessor(tables: [Fleet, ShipMods, ShipPersonalities])
class FleetDao extends DatabaseAccessor<AppDatabase> with _$FleetDaoMixin {
  FleetDao(super.db);

  Future<List<FleetShip>> getCorpShips(String corpName) =>
      (select(fleet)..where((t) => t.corpName.equals(corpName))).get();

  Future<List<FleetShip>> getSquadronShips(String corpName, String squadron) =>
      (select(fleet)..where((t) => t.corpName.equals(corpName) & t.squadron.equals(squadron))).get();

  Future<FleetShip?> getShipByName(String shipName) =>
      (select(fleet)..where((t) => t.shipName.equals(shipName))).getSingleOrNull();

  Future<List<ShipMod>> getShipMods(String shipName) =>
      (select(shipMods)..where((t) => t.shipName.equals(shipName))).get();

  Future<List<ShipPersonality>> getShipPersonalities(String shipName) =>
      (select(shipPersonalities)..where((t) => t.shipName.equals(shipName))).get();

  Future<int> insertShip(FleetCompanion ship) => into(fleet).insert(ship);

  Future<bool> updateShip(FleetCompanion ship) => update(fleet).replace(ship);

  Future<int> deleteShip(int id) => (delete(fleet)..where((t) => t.id.equals(id))).go();
}

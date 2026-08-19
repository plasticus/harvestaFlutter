import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/tables.dart';
import 'daos/game_data_dao.dart';
import 'daos/corp_dao.dart';
import 'daos/inventory_dao.dart';
import 'daos/research_dao.dart';
import 'daos/station_dao.dart';
import 'daos/fleet_dao.dart';
import 'daos/crew_dao.dart';
import 'daos/asteroid_dao.dart';
import 'daos/mission_dao.dart';
import 'daos/ledger_dao.dart';
import 'daos/catalog_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Asteroids,
    AsteroidsScanned,
    TempAsteroidsScanned,
    Cadets,
    CadetsProgress,
    Characters,
    CombatStats,
    CorpInventory,
    CorpResearch,
    Crew,
    CrewGenerate,
    Fleet,
    GameData,
    Members,
    MissionHolder,
    MissionInterruptors,
    MissionTextGenerator,
    Rolls,
    Salvage,
    ScavengeList,
    ShipModels,
    ShipMods,
    ShipModsAvailable,
    ShipPersonalities,
    StationBuildings,
    CorpTurnActions,
    CorpFinanceLedger,
  ],
  daos: [
    GameDataDao,
    CorpDao,
    InventoryDao,
    ResearchDao,
    StationDao,
    FleetDao,
    CrewDao,
    AsteroidDao,
    MissionDao,
    LedgerDao,
    CatalogDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'harvesta');
  }
}

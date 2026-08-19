import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/app_database.dart';
import '../data/database_seeder.dart';
import '../data/daos/game_data_dao.dart';
import '../data/daos/corp_dao.dart';
import '../data/daos/inventory_dao.dart';
import '../data/daos/research_dao.dart';
import '../data/daos/station_dao.dart';
import '../data/daos/fleet_dao.dart';
import '../data/daos/crew_dao.dart';
import '../data/daos/asteroid_dao.dart';
import '../data/daos/mission_dao.dart';
import '../data/daos/ledger_dao.dart';
import '../data/daos/catalog_dao.dart';

/// Central database provider singleton
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// Database seeder provider
final databaseSeederProvider = Provider<DatabaseSeeder>((ref) {
  return DatabaseSeeder(ref.watch(databaseProvider));
});

// Domain DAO providers
final gameDataDaoProvider = Provider<GameDataDao>((ref) => ref.watch(databaseProvider).gameDataDao);
final corpDaoProvider = Provider<CorpDao>((ref) => ref.watch(databaseProvider).corpDao);
final inventoryDaoProvider = Provider<InventoryDao>((ref) => ref.watch(databaseProvider).inventoryDao);
final researchDaoProvider = Provider<ResearchDao>((ref) => ref.watch(databaseProvider).researchDao);
final stationDaoProvider = Provider<StationDao>((ref) => ref.watch(databaseProvider).stationDao);
final fleetDaoProvider = Provider<FleetDao>((ref) => ref.watch(databaseProvider).fleetDao);
final crewDaoProvider = Provider<CrewDao>((ref) => ref.watch(databaseProvider).crewDao);
final asteroidDaoProvider = Provider<AsteroidDao>((ref) => ref.watch(databaseProvider).asteroidDao);
final missionDaoProvider = Provider<MissionDao>((ref) => ref.watch(databaseProvider).missionDao);
final ledgerDaoProvider = Provider<LedgerDao>((ref) => ref.watch(databaseProvider).ledgerDao);
final catalogDaoProvider = Provider<CatalogDao>((ref) => ref.watch(databaseProvider).catalogDao);

import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../economy/ledger_service.dart';

class BuildingInfo {
  final String type;
  final String name;
  final int level;
  final int upgradeCost;
  final String benefit;

  const BuildingInfo({
    required this.type,
    required this.name,
    required this.level,
    required this.upgradeCost,
    required this.benefit,
  });
}

class StationService {
  final AppDatabase db;

  StationService(this.db);

  static const Map<String, ({String nameL1, String nameL2, String nameL3, String benefit})> buildingMeta = {
    'Scanner': (
      nameL1: 'Asteroid Scanner',
      nameL2: 'Deep Belt Scan Array',
      nameL3: 'Quantum Lidar Sensor Array',
      benefit: 'Expands radar sweep candidate count and sector range.',
    ),
    'Research': (
      nameL1: 'Workshop',
      nameL2: 'Laboratory',
      nameL3: 'Research Center',
      benefit: 'Boosts daily RP research output and scientist breakthrough chances.',
    ),
    'Academy': (
      nameL1: 'Technical School',
      nameL2: 'Fleet Training Center',
      nameL3: 'Fleet Training Academy',
      benefit: 'Increases cadet recruitment soft & hard caps and walk-in rates.',
    ),
    'Repair': (
      nameL1: 'Dry Dock',
      nameL2: 'Orbital Shipyard',
      nameL3: 'Fleet Engineering Complex',
      benefit: 'Accelerates damaged vessel repair rates and lowers refit costs.',
    ),
    'shipDefense': (
      nameL1: 'Point Defense Cannons',
      nameL2: 'Flak Turret Grid',
      nameL3: 'Station Defense Citadel',
      benefit: 'Protects space station against pirate raids and AI sabotage.',
    ),
  };

  /// Calculates upgrade cost based on current level
  int getUpgradeCost(int currentLevel) => 100000 * currentLevel;

  /// Fetches all station facilities with live metadata
  Future<List<BuildingInfo>> getStationBuildings(String corpName) async {
    final list = await db.stationDao.getBuildings(corpName);
    return list.map((b) {
      final meta = buildingMeta[b.buildingType];
      final level = b.level;
      final cost = getUpgradeCost(level);

      String displayName = b.buildingName ?? b.buildingType;
      if (meta != null) {
        if (level == 1) {
          displayName = meta.nameL1;
        } else if (level == 2) {
          displayName = meta.nameL2;
        } else {
          displayName = meta.nameL3;
        }
      }

      return BuildingInfo(
        type: b.buildingType,
        name: displayName,
        level: level,
        upgradeCost: cost,
        benefit: meta?.benefit ?? 'Station facility.',
      );
    }).toList();
  }

  /// Upgrades a station facility
  Future<bool> upgradeBuilding({
    required String corpName,
    required String buildingType,
    required int turn,
  }) async {
    final building = await db.stationDao.getBuilding(corpName, buildingType);
    if (building == null) return false;

    final currentLevel = building.level;
    final cost = getUpgradeCost(currentLevel);

    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    if (solars < cost) {
      throw StateError('Insufficient Solars. Required: ⁂$cost (Available: ⁂$solars).');
    }

    final newLevel = currentLevel + 1;
    final meta = buildingMeta[buildingType];
    String newName = building.buildingName ?? buildingType;
    if (meta != null) {
      if (newLevel == 1) {
        newName = meta.nameL1;
      } else if (newLevel == 2) {
        newName = meta.nameL2;
      } else {
        newName = meta.nameL3;
      }
    }

    // Deduct Solars
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -cost);

    // Update building
    await (db.update(db.stationBuildings)
          ..where((b) => b.corpName.equals(corpName) & b.buildingType.equals(buildingType)))
        .write(
      StationBuildingsCompanion(
        level: Value(newLevel),
        buildingName: Value(newName),
      ),
    );

    // Record ledger expense
    final ledgerService = LedgerService(db);
    await ledgerService.recordExpense(
      corpName: corpName,
      turn: turn,
      amount: cost,
      category: 'facilities',
      description: 'Upgraded $buildingType to Level $newLevel ($newName)',
    );

    return true;
  }
}

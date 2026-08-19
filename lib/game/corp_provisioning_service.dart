import 'dart:math';
import 'package:drift/drift.dart';
import '../data/app_database.dart';

class CorpProvisioningService {
  final AppDatabase db;

  CorpProvisioningService(this.db);

  /// Provisions a new corporation with starter assets, buildings, tech, fleet, and crew.
  Future<void> provisionNewGame({
    required String corpName,
    String? stationName,
    String heritage = 'Earth',
    String squadronName = 'Alpha Squadron',
    int startingSolars = 250000,
  }) async {
    final effectiveStationName = stationName?.trim().isNotEmpty == true
        ? stationName!.trim()
        : '$corpName Station';

    // 1. Create or ensure Member record
    final existingMember = await db.corpDao.getCorpByName(corpName);
    if (existingMember == null) {
      await db.corpDao.createCorp(corpName, isAi: false, verified: true);
    }

    // 2. Set Starting Solars & Stockpiles
    await db.inventoryDao.setItemQuantity(corpName, 'Solars', startingSolars);
    final starterResources = {
      'Life Support Gases': 100,
      'Fuel Gases': 100,
      'Conductive Metals': 100,
      'Zero-G Construction Metals': 100,
      'Surface Construction Metals': 100,
      'Other Valuable Elements': 25,
      'Water Ice': 100,
    };

    for (final entry in starterResources.entries) {
      await db.inventoryDao.setItemQuantity(corpName, entry.key, entry.value);
    }

    // 3. Provision Station Buildings (All Level 1)
    final initialBuildings = [
      (type: 'Academy', name: 'Fleet Training Academy'),
      (type: 'Research', name: 'Workshop'),
      (type: 'Scanner', name: 'Asteroid Scanner'),
      (type: 'Repair', name: 'Dry Dock'),
      (type: 'shipDefense', name: 'Point Defense Cannons'),
    ];

    for (final b in initialBuildings) {
      final existingB = await db.stationDao.getBuilding(corpName, b.type);
      if (existingB == null) {
        await db.into(db.stationBuildings).insert(
              StationBuildingsCompanion.insert(
                corpName: Value(corpName),
                stationName: effectiveStationName,
                buildingType: b.type,
                buildingName: Value(b.name),
                power: const Value(1),
                level: const Value(1),
              ),
            );
      }
    }

    // 4. Provision Research Trees (Heritage specialty at Level 1, others at Level 0)
    final allTechs = [
      'academy',
      'armorSystems',
      'asteroidMining',
      'asteroidScanning',
      'astrogation',
      'combatDefense',
      'combatTargeting',
      'repair',
      'tradeRelationships',
    ];

    var heritageTech = 'tradeRelationships';
    if (heritage == 'Mars') {
      heritageTech = 'combatTargeting';
    } else if (heritage == 'Ceres') {
      heritageTech = 'asteroidMining';
    }

    for (final tech in allTechs) {
      final startLevel = (tech == heritageTech) ? 1 : 0;
      await db.researchDao.upsertResearch(corpName, tech, startLevel, 0, 1000);
    }

    // 5. Provision Starter Ships (1 Freighter Flagship + 2 Corvette Escorts)
    final existingShips = await db.fleetDao.getCorpShips(corpName);
    if (existingShips.isEmpty) {
      final allModels = await db.catalogDao.getAllShipModels();

      final freighters = allModels.where((m) => m.shipClass == 'Freighter' || m.shipClass == 'Courier').toList();
      final corvettes = allModels.where((m) => m.shipClass == 'Corvette' || m.shipClass == 'Scout' || m.shipClass == 'Frigate').toList();

      final flagshipModel = freighters.isNotEmpty ? freighters.first : allModels.first;
      final escortModel = corvettes.isNotEmpty ? corvettes.first : allModels.first;

      final flagshipName = '$corpName Pioneer';
      final escort1Name = '$corpName Cutter Alpha';
      final escort2Name = '$corpName Cutter Beta';

      await _insertShipFromModel(corpName, flagshipName, flagshipModel, squadronName);
      await _insertShipFromModel(corpName, escort1Name, escortModel, squadronName);
      await _insertShipFromModel(corpName, escort2Name, escortModel, squadronName);

      // 6. Provision Starter Crew Officers
      await _provisionStarterCrew(corpName, flagshipName);
    }

    // 7. Initialize Turn Actions Record
    final turn = await db.gameDataDao.getTurn();
    await db.ledgerDao.recordTurnAction(
      corpName,
      turn,
      CorpTurnActionsCompanion.insert(
        corpName: corpName,
        gameTurn: turn,
        scanDone: const Value(false),
        mineDone: const Value(false),
        researchDone: const Value(false),
        cadetsDone: const Value(false),
        expeditionDone: const Value(false),
        marketDone: const Value(false),
      ),
    );

    // 8. Record Initial Ledger Snapshot
    await db.ledgerDao.recordLedgerEntry(
      CorpFinanceLedgerCompanion.insert(
        corpName: corpName,
        gameTurn: turn,
        netWorth: Value(startingSolars + 750000), // Starting Solars + Fleet baseline
        solars: Value(startingSolars),
        fleetVal: const Value(750000),
        materialsVal: const Value(50000),
        revenue: const Value(0),
        expenses: const Value(0),
        notes: const Value('Corporation Commissioned'),
      ),
    );
  }

  Future<void> _insertShipFromModel(
    String corpName,
    String shipName,
    ShipModelEntry model,
    String squadron,
  ) async {
    await db.into(db.fleet).insert(
          FleetCompanion.insert(
            corpName: Value(corpName),
            squadron: Value(squadron),
            shipName: shipName,
            shipClass: Value(model.shipClass),
            shipSize: Value(model.size),
            shipModel: Value(model.model),
            weap: Value(model.weap),
            armor: Value(model.armor),
            bays: Value(model.bays),
            cargo: Value(model.cargo),
            engines: Value(model.engines),
            maneuv: Value(model.maneuv),
            weapCtrl: Value(model.weapCtrl),
            cloak: Value(model.cloak),
            lifeSupp: Value(model.lifeSupp),
            maxCargo: Value(model.maxCargo),
            maxEngines: Value(model.maxEngines),
            maxManeuv: Value(model.maxManeuv),
            maxWeapCtrl: Value(model.maxWeapCtrl),
            maxLifeSupp: Value(model.maxLifeSupp),
            hp: Value(model.hp),
            maxHp: Value(model.maxHp),
            value: Value(model.baseValue),
            maxShipValue: Value(model.baseValue),
          ),
        );
  }

  Future<void> _provisionStarterCrew(String corpName, String flagshipName) async {
    final namePool = await db.select(db.crewGenerate).get();
    final rng = Random();

    final roles = ['Captain', 'First Officer', 'Pilot', 'Science Officer', 'Chief Engineer', 'Tactical Officer'];

    for (final role in roles) {
      String officerName;
      if (namePool.isNotEmpty) {
        final entry = namePool[rng.nextInt(namePool.length)];
        officerName = '${entry.forename ?? 'Officer'} ${entry.surname ?? 'Vance'}';
      } else {
        officerName = 'Commander $role';
      }

      await db.into(db.crew).insert(
            CrewCompanion.insert(
              corpName: Value(corpName),
              squadron: const Value('Alpha Squadron'),
              shipName: Value(flagshipName),
              assignment: Value(role),
              status: const Value('Active'),
              name: officerName,
              leadership: Value(rng.nextInt(15) + 10),
              influence: Value(rng.nextInt(15) + 10),
              pilot: Value(role == 'Pilot' ? 25 : rng.nextInt(12) + 5),
              computation: Value(role == 'Science Officer' ? 25 : rng.nextInt(12) + 5),
              repair: Value(role == 'Chief Engineer' ? 25 : rng.nextInt(12) + 5),
              shipWeapons: Value(role == 'Tactical Officer' ? 25 : rng.nextInt(12) + 5),
              fighting: Value(rng.nextInt(12) + 5),
              athletics: Value(rng.nextInt(12) + 5),
            ),
          );
    }
  }
}

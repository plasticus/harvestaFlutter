import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../economy/ledger_service.dart';

class RepairEstimate {
  final int totalCur;
  final int totalMax;
  final double damageFraction;
  final int contractCost;
  final int inHouseCost;
  final int zeroGMetals;
  final int conductiveMetals;
  final int lifeSupportGases;
  final double discount;
  final bool needsRepair;

  const RepairEstimate({
    required this.totalCur,
    required this.totalMax,
    required this.damageFraction,
    required this.contractCost,
    required this.inHouseCost,
    required this.zeroGMetals,
    required this.conductiveMetals,
    required this.lifeSupportGases,
    required this.discount,
    required this.needsRepair,
  });
}

class ShipService {
  final AppDatabase db;

  ShipService(this.db);

  /// Calculates repair costs and material requirements for a vessel
  Future<RepairEstimate> getRepairEstimate(String corpName, String shipName) async {
    final ship = await db.fleetDao.getShipByName(shipName);
    if (ship == null) {
      throw ArgumentError('Ship "$shipName" not found.');
    }

    final totalMax = ship.maxCargo + ship.maxEngines + ship.maxManeuv + ship.maxWeapCtrl + ship.maxLifeSupp + ship.maxHp;
    final totalCur = ship.cargo + ship.engines + ship.maneuv + ship.weapCtrl + ship.lifeSupp + ship.hp;

    if (totalCur >= totalMax) {
      return RepairEstimate(
        totalCur: totalCur,
        totalMax: totalMax,
        damageFraction: 0.0,
        contractCost: 0,
        inHouseCost: 0,
        zeroGMetals: 0,
        conductiveMetals: 0,
        lifeSupportGases: 0,
        discount: 0.0,
        needsRepair: false,
      );
    }

    final damageP = totalMax > 0 ? (totalCur / totalMax) : 1.0;
    var contractCost = (ship.maxShipValue * (1.0 - damageP) / 10.0).floor();
    var inHouseCost = (ship.maxShipValue * (1.0 - damageP) / 40.0).floor();

    var zeroG = ((contractCost / 2.0) * 0.7 / 360.0).floor();
    var conductive = ((contractCost / 2.0) * 0.2 / 420.0).ceil();
    var lifeSupp = ((contractCost / 2.0) * 0.1 / 540.0).ceil();

    final sbTech = await db.researchDao.getResearchItem(corpName, 'shipBuilding');
    final sbLevel = sbTech?.level ?? 0;
    final discount = min(0.25, sbLevel * 0.05);

    if (discount > 0) {
      contractCost = max(1, (contractCost * (1.0 - discount)).floor());
      inHouseCost = max(1, (inHouseCost * (1.0 - discount)).floor());
      zeroG = max(1, (zeroG * (1.0 - discount)).ceil());
      conductive = max(1, (conductive * (1.0 - discount)).ceil());
      lifeSupp = max(1, (lifeSupp * (1.0 - discount)).ceil());
    }

    return RepairEstimate(
      totalCur: totalCur,
      totalMax: totalMax,
      damageFraction: 1.0 - damageP,
      contractCost: contractCost,
      inHouseCost: inHouseCost,
      zeroGMetals: zeroG,
      conductiveMetals: conductive,
      lifeSupportGases: lifeSupp,
      discount: discount,
      needsRepair: true,
    );
  }

  /// Executes Drydock repairs (Contract with Solars only, or In-House with Solars + materials)
  Future<bool> repairShip({
    required String corpName,
    required String shipName,
    required bool inHouse,
    required int turn,
  }) async {
    final ship = await db.fleetDao.getShipByName(shipName);
    if (ship == null) return false;

    final est = await getRepairEstimate(corpName, shipName);
    if (!est.needsRepair) return true;

    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');

    if (inHouse) {
      if (solars < est.inHouseCost) {
        throw StateError('Insufficient Solars. Required: ⁂${est.inHouseCost} (Available: ⁂$solars).');
      }

      final zeroG = await db.inventoryDao.getItemQuantity(corpName, 'Zero-G Construction Metals');
      if (zeroG < est.zeroGMetals) {
        throw StateError('Insufficient Zero-G Metals. Required: ${est.zeroGMetals} m³ (Available: $zeroG m³).');
      }

      final conductive = await db.inventoryDao.getItemQuantity(corpName, 'Conductive Metals');
      if (conductive < est.conductiveMetals) {
        throw StateError('Insufficient Conductive Metals. Required: ${est.conductiveMetals} m³ (Available: $conductive m³).');
      }

      final lifeSupp = await db.inventoryDao.getItemQuantity(corpName, 'Life Support Gases');
      if (lifeSupp < est.lifeSupportGases) {
        throw StateError('Insufficient Life Support Gases. Required: ${est.lifeSupportGases} m³ (Available: $lifeSupp m³).');
      }

      // Deduct resources
      await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -est.inHouseCost);
      await db.inventoryDao.adjustItemQuantity(corpName, 'Zero-G Construction Metals', -est.zeroGMetals);
      await db.inventoryDao.adjustItemQuantity(corpName, 'Conductive Metals', -est.conductiveMetals);
      await db.inventoryDao.adjustItemQuantity(corpName, 'Life Support Gases', -est.lifeSupportGases);

      final ledger = LedgerService(db);
      await ledger.recordExpense(
        corpName: corpName,
        turn: turn,
        amount: est.inHouseCost,
        category: 'repairs',
        description: 'In-House Drydock repair for $shipName',
      );
    } else {
      if (solars < est.contractCost) {
        throw StateError('Insufficient Solars. Required: ⁂${est.contractCost} (Available: ⁂$solars).');
      }

      await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -est.contractCost);

      final ledger = LedgerService(db);
      await ledger.recordExpense(
        corpName: corpName,
        turn: turn,
        amount: est.contractCost,
        category: 'repairs',
        description: 'Contract Drydock repair for $shipName',
      );
    }

    // Restore ship subsystems to 100%
    await (db.update(db.fleet)..where((f) => f.shipName.equals(shipName))).write(
      FleetCompanion(
        cargo: Value(ship.maxCargo),
        engines: Value(ship.maxEngines),
        maneuv: Value(ship.maxManeuv),
        weapCtrl: Value(ship.maxWeapCtrl),
        lifeSupp: Value(ship.maxLifeSupp),
        hp: Value(ship.maxHp),
      ),
    );

    return true;
  }

  /// Purchases a new vessel from the orbital shipyard
  Future<bool> purchaseShip({
    required String corpName,
    required String modelName,
    required String shipName,
    required String squadron,
    required int turn,
  }) async {
    final cleanName = shipName.trim();
    if (cleanName.isEmpty) {
      throw ArgumentError('Ship name cannot be empty.');
    }

    final existing = await (db.select(db.fleet)..where((f) => f.shipName.equals(cleanName))).getSingleOrNull();
    if (existing != null) {
      throw StateError('A vessel named "$cleanName" already exists in the fleet registry.');
    }

    final model = await (db.select(db.shipModels)..where((m) => m.model.equals(modelName))).getSingleOrNull();
    if (model == null) {
      throw ArgumentError('Unknown ship model "$modelName".');
    }

    final sbTech = await db.researchDao.getResearchItem(corpName, 'shipBuilding');
    final sbLevel = sbTech?.level ?? 0;
    final discount = min(0.25, sbLevel * 0.05);
    final cost = max(1, (model.baseValue * (1.0 - discount)).round());

    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    if (solars < cost) {
      throw StateError('Insufficient Solars. Cost: ⁂$cost (Available: ⁂$solars).');
    }

    // Deduct Solars
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -cost);

    // Record expense
    final ledger = LedgerService(db);
    await ledger.recordExpense(
      corpName: corpName,
      turn: turn,
      amount: cost,
      category: 'fleet',
      description: 'Commissioned $modelName ($cleanName) into $squadron',
    );

    // Insert ship into fleet
    await db.into(db.fleet).insert(
          FleetCompanion.insert(
            corpName: Value(corpName),
            shipName: cleanName,
            shipModel: Value(modelName),
            squadron: Value(squadron),
            shipClass: Value(model.shipClass ?? 'Civilian'),
            shipSize: Value(model.size),
            value: Value(model.baseValue),
            maxShipValue: Value(model.baseValue),
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
          ),
        );

    return true;
  }

  /// Decommissions and sells a vessel from the fleet
  Future<int> sellShip({
    required String corpName,
    required String shipName,
    required int turn,
  }) async {
    final ship = await db.fleetDao.getShipByName(shipName);
    if (ship == null) {
      throw ArgumentError('Ship "$shipName" not found.');
    }

    var value = ship.value;

    // Check for Green Slime quirk depreciation
    final quirks = await (db.select(db.shipPersonalities)..where((p) => p.shipName.equals(shipName))).get();
    final greenSlime = quirks.where((q) => q.personality == 'Green Slime').firstOrNull;
    if (greenSlime != null) {
      value = (value * (1.0 - (greenSlime.level * 0.15))).floor();
    }

    // Credit Solars
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', value);

    // Record revenue
    final ledger = LedgerService(db);
    await ledger.recordRevenue(
      corpName: corpName,
      turn: turn,
      amount: value,
      category: 'fleet',
      description: 'Decommissioned $shipName for scrap value',
    );

    // Delete ship and associated records
    await (db.delete(db.shipMods)..where((m) => m.shipName.equals(shipName))).go();
    await (db.delete(db.shipPersonalities)..where((p) => p.shipName.equals(shipName))).go();

    // Unassign crew members
    await (db.update(db.crew)..where((c) => c.corpName.equals(corpName) & c.shipName.equals(shipName))).write(
      const CrewCompanion(
        shipName: Value(''),
        assignment: Value('Unassigned'),
        squadron: Value(''),
      ),
    );

    await (db.delete(db.fleet)..where((f) => f.shipName.equals(shipName))).go();

    return value;
  }
}

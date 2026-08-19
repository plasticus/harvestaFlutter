import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../economy/ledger_service.dart';

class ShipHardpointsInfo {
  final int weapUsed;
  final int weapMax;
  final int armorUsed;
  final int armorMax;
  final int bayUsed;
  final int bayMax;
  final List<ShipMod> installedMods;

  const ShipHardpointsInfo({
    required this.weapUsed,
    required this.weapMax,
    required this.armorUsed,
    required this.armorMax,
    required this.bayUsed,
    required this.bayMax,
    required this.installedMods,
  });
}

class ShipModService {
  final AppDatabase db;

  ShipModService(this.db);

  /// Calculates available hardpoint slots and counts installed modules
  Future<ShipHardpointsInfo> getShipHardpoints(String corpName, String shipName) async {
    final ship = await db.fleetDao.getShipByName(shipName);
    if (ship == null) {
      throw ArgumentError('Ship "$shipName" not found.');
    }

    final model = await (db.select(db.shipModels)..where((m) => m.model.equals(ship.shipModel ?? ''))).getSingleOrNull();
    final baseWeap = model?.weap ?? ship.weap;
    final baseArmor = model?.armor ?? ship.armor;
    final baseBays = model?.bays ?? ship.bays;

    // Check Ship Bay research bonus (+1 bay slot at L3, +2 at L5)
    final bayTech = await db.researchDao.getResearchItem(corpName, 'shipBay');
    final bayTechLevel = bayTech?.level ?? 0;
    final bayBonus = (bayTechLevel >= 5) ? 2 : ((bayTechLevel >= 3) ? 1 : 0);

    final maxWeap = baseWeap;
    final maxArmor = baseArmor;
    final maxBays = baseBays + bayBonus;

    final mods = await (db.select(db.shipMods)..where((m) => m.shipName.equals(shipName))).get();

    final weapUsed = mods.where((m) => m.modType == 'Weapon').length;
    final armorUsed = mods.where((m) => m.modType == 'Armor').length;
    final bayUsed = mods.where((m) => m.modType == 'Bay').length;

    return ShipHardpointsInfo(
      weapUsed: weapUsed,
      weapMax: maxWeap,
      armorUsed: armorUsed,
      armorMax: maxArmor,
      bayUsed: bayUsed,
      bayMax: maxBays,
      installedMods: mods,
    );
  }

  /// Installs and fits an upgrade module onto a vessel
  Future<bool> installModule({
    required String corpName,
    required String shipName,
    required String modName,
    required int turn,
  }) async {
    final modSpec = await (db.select(db.shipModsAvailable)..where((m) => m.modName.equals(modName))).getSingleOrNull();
    if (modSpec == null) {
      throw ArgumentError('Unknown module specification "$modName".');
    }

    final hardpoints = await getShipHardpoints(corpName, shipName);
    final modType = modSpec.modType ?? 'Bay';

    // Validate slot capacity
    if (modType == 'Weapon' && hardpoints.weapUsed >= hardpoints.weapMax) {
      throw StateError('All Weapon hardpoints are full (${hardpoints.weapUsed} / ${hardpoints.weapMax}).');
    } else if (modType == 'Armor' && hardpoints.armorUsed >= hardpoints.armorMax) {
      throw StateError('All Armor hardpoints are full (${hardpoints.armorUsed} / ${hardpoints.armorMax}).');
    } else if (modType == 'Bay' && hardpoints.bayUsed >= hardpoints.bayMax) {
      throw StateError('All Bay hardpoints are full (${hardpoints.bayUsed} / ${hardpoints.bayMax}).');
    }

    final price = modSpec.price;
    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    if (solars < price) {
      throw StateError('Insufficient Solars. Cost: ⁂$price (Available: ⁂$solars).');
    }

    // Deduct Solars
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -price);

    // Record expense
    final ledger = LedgerService(db);
    await ledger.recordExpense(
      corpName: corpName,
      turn: turn,
      amount: price,
      category: 'modules',
      description: 'Fitted $modName onto $shipName',
    );

    // Insert module
    await db.into(db.shipMods).insert(
          ShipModsCompanion.insert(
            shipName: Value(shipName),
            modType: Value(modType),
            modName: Value(modName),
            power: Value(modSpec.power),
          ),
        );

    // Recalculate ship value
    await _recalculateShipValue(corpName, shipName);
    return true;
  }

  /// Uninstalls a fitted module and refunds 50% scrap value
  Future<int> uninstallModule({
    required String corpName,
    required String shipName,
    required int modId,
    required int turn,
  }) async {
    final mod = await (db.select(db.shipMods)..where((m) => m.modId.equals(modId))).getSingleOrNull();
    if (mod == null) {
      throw ArgumentError('Module with ID $modId not found on ship.');
    }

    final modSpec = await (db.select(db.shipModsAvailable)..where((m) => m.modName.equals(mod.modName ?? ''))).getSingleOrNull();
    final price = modSpec?.price ?? 100000;
    final refund = (price / 2.0).floor();

    // Credit Solars
    await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', refund);

    // Record refund
    final ledger = LedgerService(db);
    await ledger.recordRevenue(
      corpName: corpName,
      turn: turn,
      amount: refund,
      category: 'modules',
      description: 'Scrapped ${mod.modName} from $shipName',
    );

    // Delete module
    await (db.delete(db.shipMods)..where((m) => m.modId.equals(modId))).go();

    // Recalculate ship value
    await _recalculateShipValue(corpName, shipName);
    return refund;
  }

  Future<void> _recalculateShipValue(String corpName, String shipName) async {
    final ship = await db.fleetDao.getShipByName(shipName);
    if (ship == null) return;

    final model = await (db.select(db.shipModels)..where((m) => m.model.equals(ship.shipModel ?? ''))).getSingleOrNull();
    final baseValue = model?.baseValue ?? 500000;

    final mods = await (db.select(db.shipMods)..where((m) => m.shipName.equals(shipName))).get();
    var modTotal = 0;
    for (final m in mods) {
      final spec = await (db.select(db.shipModsAvailable)..where((s) => s.modName.equals(m.modName ?? ''))).getSingleOrNull();
      modTotal += spec?.price ?? 0;
    }

    final newValue = baseValue + modTotal;

    await (db.update(db.fleet)..where((f) => f.shipName.equals(shipName))).write(
      FleetCompanion(
        value: Value(newValue),
        maxShipValue: Value(newValue),
      ),
    );
  }
}

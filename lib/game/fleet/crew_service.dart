import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../economy/ledger_service.dart';

class CrewService {
  final AppDatabase db;

  CrewService(this.db);

  /// Assigns bridge officers to a specific vessel
  Future<void> assignBridgeCrew({
    required String corpName,
    required String shipName,
    int? captainId,
    int? pilotId,
    int? firstOfficerId,
    int? secondOfficerId,
  }) async {
    final ship = await db.fleetDao.getShipByName(shipName);
    if (ship == null) {
      throw ArgumentError('Ship "$shipName" not found.');
    }

    final squadron = ship.squadron;

    // Step 1: Unassign current bridge officers from this ship
    await (db.update(db.crew)
          ..where((c) =>
              c.corpName.equals(corpName) &
              c.shipName.equals(shipName) &
              c.assignment.isIn(['Captain', 'Pilot', 'First Officer', 'Second Officer'])))
        .write(
      const CrewCompanion(
        shipName: Value(''),
        assignment: Value('Unassigned'),
        squadron: Value(''),
      ),
    );

    // Step 2: Assign new roles
    final assignments = <String, int?>{
      'Captain': captainId,
      'Pilot': pilotId,
      'First Officer': firstOfficerId,
      'Second Officer': secondOfficerId,
    };

    for (final entry in assignments.entries) {
      final role = entry.key;
      final officerId = entry.value;
      if (officerId != null && officerId > 0) {
        await (db.update(db.crew)..where((c) => c.id.equals(officerId) & c.corpName.equals(corpName))).write(
          CrewCompanion(
            shipName: Value(shipName),
            assignment: Value(role),
            squadron: Value(squadron),
          ),
        );
      }
    }
  }

  /// Sets officer task (e.g. 'Research' or 'Unassigned')
  Future<void> setOfficerTask({
    required String corpName,
    required int officerId,
    required String assignment,
  }) async {
    if (assignment == 'Research' || assignment.isEmpty || assignment == 'Unassigned') {
      await (db.update(db.crew)..where((c) => c.id.equals(officerId) & c.corpName.equals(corpName))).write(
        CrewCompanion(
          assignment: Value(assignment.isEmpty ? 'Unassigned' : assignment),
          shipName: const Value(''),
          squadron: const Value(''),
        ),
      );
    } else {
      await (db.update(db.crew)..where((c) => c.id.equals(officerId) & c.corpName.equals(corpName))).write(
        CrewCompanion(assignment: Value(assignment)),
      );
    }
  }

  /// Calculates hiring fee for a cadet candidate
  int calculateCadetFee(Cadet cadet, int tradeRelationshipsLevel) {
    final skillSum = cadet.leadership +
        cadet.influence +
        cadet.pilot +
        cadet.computation +
        cadet.repair +
        cadet.shipWeapons +
        cadet.firearms +
        cadet.melee +
        cadet.athletics;
    final baseFee = max(10000, skillSum * 250);
    final discount = min(0.20, tradeRelationshipsLevel * 0.04);
    return (baseFee * (1.0 - discount)).round();
  }

  /// Hires a cadet from the recruitment academy
  Future<bool> hireCadet({
    required String corpName,
    required int cadetId,
    required int turn,
  }) async {
    final cadet = await (db.select(db.cadets)..where((c) => c.id.equals(cadetId))).getSingleOrNull();
    if (cadet == null) {
      throw ArgumentError('Cadet candidate no longer available.');
    }

    final trTech = await db.researchDao.getResearchItem(corpName, 'tradeRelationships');
    final tradeLevel = trTech?.level ?? 0;
    final fee = calculateCadetFee(cadet, tradeLevel);

    if (fee > 0) {
      final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
      if (solars < fee) {
        throw StateError('Insufficient Solars. Required: ⁂$fee (Available: ⁂$solars).');
      }

      await db.inventoryDao.adjustItemQuantity(corpName, 'Solars', -fee);

      final ledger = LedgerService(db);
      await ledger.recordExpense(
        corpName: corpName,
        turn: turn,
        amount: fee,
        category: 'payroll',
        description: 'Commissioned Cadet ${cadet.name} into service',
      );
    }

    // Insert as active officer
    await db.into(db.crew).insert(
          CrewCompanion.insert(
            corpName: Value(corpName),
            name: cadet.name,
            assignment: const Value('Unassigned'),
            status: const Value('Active'),
            leadership: Value(cadet.leadership),
            influence: Value(cadet.influence),
            pilot: Value(cadet.pilot),
            computation: Value(cadet.computation),
            repair: Value(cadet.repair),
            shipWeapons: Value(cadet.shipWeapons),
            fighting: Value(cadet.firearms + cadet.melee),
            athletics: Value(cadet.athletics),
          ),
        );

    // Remove from cadet board
    await (db.delete(db.cadets)..where((c) => c.id.equals(cadetId))).go();

    return true;
  }

  /// Calculates total payroll cost for all corp crew members
  Future<int> calculatePayroll(String corpName) async {
    final crew = await db.crewDao.getCorpCrew(corpName);
    var totalPayroll = 0;

    for (final c in crew) {
      final skillSum = c.leadership + c.influence + c.pilot + c.computation + c.repair + c.shipWeapons + c.fighting + c.athletics;
      totalPayroll += 1000 + (skillSum * 100);
    }

    return totalPayroll;
  }
}

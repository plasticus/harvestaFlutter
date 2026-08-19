import 'package:drift/drift.dart';
import '../../data/app_database.dart';

class CorpValuationSummary {
  final int treasurySolars;
  final int fleetValue;
  final int materialValue;
  final int estimatedPayroll;
  final int totalNetWorth;

  const CorpValuationSummary({
    required this.treasurySolars,
    required this.fleetValue,
    required this.materialValue,
    required this.estimatedPayroll,
    required this.totalNetWorth,
  });
}

class LedgerService {
  final AppDatabase db;

  LedgerService(this.db);

  static const Map<String, int> appraisalPrices = {
    'Surface Construction Metals': 320,
    'Zero-G Construction Metals': 680,
    'Conductive Metals': 990,
    'Life Support Gases': 580,
    'Fuel Gases': 450,
    'Other Valuable Elements': 2160,
    'Water Ice': 360,
  };

  /// Calculates a comprehensive asset valuation and payroll liability breakdown.
  Future<CorpValuationSummary> calculateValuations(String corpName) async {
    // 1. Treasury Solars
    final treasury = await db.inventoryDao.getItemQuantity(corpName, 'Solars');

    // 2. Fleet Valuation
    final ships = await db.fleetDao.getCorpShips(corpName);
    final fleetVal = ships.fold<int>(0, (sum, s) => sum + s.value);

    // 3. Materials Valuation
    var materialVal = 0;
    final inventory = await db.inventoryDao.getCorpInventory(corpName);
    for (final item in inventory) {
      if (item.item != 'Solars') {
        final appraisal = appraisalPrices[item.item] ?? 450;
        materialVal += (item.qty * appraisal);
      }
    }

    // 4. Crew Payroll & Cadet Stipends
    final crew = await db.crewDao.getCorpCrew(corpName);
    var officerSalary = 0;
    for (final c in crew) {
      final skillSum = c.leadership + c.influence + c.pilot + c.computation + c.repair + c.shipWeapons + c.fighting + c.athletics;
      final skillMax = [c.leadership, c.influence, c.pilot, c.computation, c.repair, c.shipWeapons, c.fighting, c.athletics].reduce((a, b) => a > b ? a : b);
      officerSalary += (skillSum * 10) + (skillMax * 20);
    }

    final cadets = await db.crewDao.getAvailableCadets();
    final cadetStipends = cadets.where((c) => c.corpName == corpName).length * 250;
    final totalPayroll = officerSalary + cadetStipends;

    final netWorth = treasury + fleetVal + materialVal;

    return CorpValuationSummary(
      treasurySolars: treasury,
      fleetValue: fleetVal,
      materialValue: materialVal,
      estimatedPayroll: totalPayroll,
      totalNetWorth: netWorth,
    );
  }

  /// Records a revenue transaction
  Future<void> recordRevenue({
    required String corpName,
    required int turn,
    required int amount,
    required String category,
    required String description,
  }) async {
    final existing = await db.ledgerDao.getLedgerHistory(corpName);
    final currentEntry = existing.where((e) => e.gameTurn == turn).firstOrNull;

    final grossRev = (currentEntry?.revenue ?? 0) + amount;
    final expenses = currentEntry?.expenses ?? 0;
    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    final valuations = await calculateValuations(corpName);

    await db.ledgerDao.recordLedgerEntry(
      CorpFinanceLedgerCompanion.insert(
        corpName: corpName,
        gameTurn: turn,
        netWorth: Value(valuations.totalNetWorth),
        solars: Value(solars),
        fleetVal: Value(valuations.fleetValue),
        materialsVal: Value(valuations.materialValue),
        revenue: Value(grossRev),
        expenses: Value(expenses),
        notes: Value('$description (+⁂$amount)'),
      ),
    );
  }

  /// Records an expense transaction
  Future<void> recordExpense({
    required String corpName,
    required int turn,
    required int amount,
    required String category,
    required String description,
  }) async {
    final existing = await db.ledgerDao.getLedgerHistory(corpName);
    final currentEntry = existing.where((e) => e.gameTurn == turn).firstOrNull;

    final revenue = currentEntry?.revenue ?? 0;
    final grossExp = (currentEntry?.expenses ?? 0) + amount;
    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    final valuations = await calculateValuations(corpName);

    await db.ledgerDao.recordLedgerEntry(
      CorpFinanceLedgerCompanion.insert(
        corpName: corpName,
        gameTurn: turn,
        netWorth: Value(valuations.totalNetWorth),
        solars: Value(solars),
        fleetVal: Value(valuations.fleetValue),
        materialsVal: Value(valuations.materialValue),
        revenue: Value(revenue),
        expenses: Value(grossExp),
        notes: Value('$description (-⁂$amount)'),
      ),
    );
  }
}

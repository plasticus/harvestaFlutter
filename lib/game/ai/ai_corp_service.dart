import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../corp_provisioning_service.dart';
import '../economy/market_price_service.dart';
import '../economy/ledger_service.dart';

enum AiFocus {
  industrial,
  scientific,
  shipbuilding,
  military,
  financial,
  balanced,
}

class AiCorpProfile {
  final String corpName;
  final String ceoName;
  final String heritage;
  final AiFocus focus;
  final String motto;
  final String description;

  const AiCorpProfile({
    required this.corpName,
    required this.ceoName,
    required this.heritage,
    required this.focus,
    required this.motto,
    required this.description,
  });
}

class CorpLeaderboardEntry {
  final int rank;
  final String corpName;
  final String ceoName;
  final String heritage;
  final bool isPlayer;
  final int netWorth;
  final int solars;
  final int inventoryValue;
  final int fleetValue;
  final int techLevelSum;
  final int shipCount;

  const CorpLeaderboardEntry({
    required this.rank,
    required this.corpName,
    required this.ceoName,
    required this.heritage,
    required this.isPlayer,
    required this.netWorth,
    required this.solars,
    required this.inventoryValue,
    required this.fleetValue,
    required this.techLevelSum,
    required this.shipCount,
  });
}

class AiCorpService {
  final AppDatabase db;
  final Random rng;

  AiCorpService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  static const List<AiCorpProfile> rivalProfiles = [
    AiCorpProfile(
      corpName: 'Weyland-Yutani',
      ceoName: 'Sir Peter Weyland',
      heritage: 'Earth',
      focus: AiFocus.industrial,
      motto: 'Building Better Worlds',
      description: 'The preeminent industrial mining and resource extraction conglomerate in the Sol system.',
    ),
    AiCorpProfile(
      corpName: 'Veidt Enterprises',
      ceoName: 'Adrian Veidt',
      heritage: 'Luna',
      focus: AiFocus.scientific,
      motto: 'Advancing Human Potential',
      description: 'Cutting-edge applied science and high-energy physics R&D technological empire.',
    ),
    AiCorpProfile(
      corpName: 'Tyrell Heavy Manufacturing',
      ceoName: 'Dr. Eldon Tyrell',
      heritage: 'Mars',
      focus: AiFocus.shipbuilding,
      motto: 'More Human Than Human',
      description: 'Heavy orbital shipyards, advanced cybernetic androids, and vessel fabrication.',
    ),
    AiCorpProfile(
      corpName: 'Cyberdyne Systems',
      ceoName: 'Miles Dyson',
      heritage: 'Earth',
      focus: AiFocus.military,
      motto: 'Pioneering Automated Defense',
      description: 'High-firepower military defense contractor, automated railgun batteries, and combat doctrine.',
    ),
    AiCorpProfile(
      corpName: 'Tessier-Ashpool SA',
      ceoName: 'Marie-France Tessier',
      heritage: 'Luna',
      focus: AiFocus.financial,
      motto: 'Generational Orbital Dominance',
      description: 'Enigmatic high-finance clan commanding deep space currency flows and commodity futures.',
    ),
    AiCorpProfile(
      corpName: 'Syndicate Mining',
      ceoName: 'Director Karl Vane',
      heritage: 'Belters',
      focus: AiFocus.industrial,
      motto: 'Unearthing the Deep Belt',
      description: 'Grit-driven belt worker consortium specializing in high-volume raw asteroid refining.',
    ),
  ];

  /// Ensures all 6 rival AI corporations exist in the database with starter assets
  Future<void> ensureRivalsProvisioned() async {
    final provisioning = CorpProvisioningService(db);

    for (final profile in rivalProfiles) {
      final existingSolars = await db.inventoryDao.getItemQuantity(profile.corpName, 'Solars');
      if (existingSolars == 0) {
        await provisioning.provisionNewGame(
          corpName: profile.corpName,
          heritage: profile.heritage,
          startingSolars: 1200000 + rng.nextInt(600000),
        );
      }
    }
  }

  /// Simulates turn progression for all 6 AI rival corporations
  Future<void> simulateTurnForAllAi({
    required int turn,
    required String playerCorp,
  }) async {
    await ensureRivalsProvisioned();

    for (final profile in rivalProfiles) {
      if (profile.corpName == playerCorp) continue;
      await _simulateSingleAiTurn(profile, turn);
    }
  }

  Future<void> _simulateSingleAiTurn(AiCorpProfile profile, int turn) async {
    final ledger = LedgerService(db);

    final solars = await db.inventoryDao.getItemQuantity(profile.corpName, 'Solars');

    // 1. Industrial & Mining Actions
    final miningYield = 100 + rng.nextInt(150);
    final resources = ['Conductive Metals', 'Zero-G Construction Metals', 'Life Support Gases', 'Fuel Gases'];
    final minedItem = resources[rng.nextInt(resources.length)];
    await db.inventoryDao.adjustItemQuantity(profile.corpName, minedItem, miningYield);

    // AI Sells a portion of inventory to market for Solars
    final sellQty = (miningYield * 0.6).round();
    final priceInfo = MarketPriceService.getPrice(commodity: minedItem, turn: turn);
    final revenue = sellQty * priceInfo.sellPrice;

    await db.inventoryDao.adjustItemQuantity(profile.corpName, minedItem, -sellQty);
    await db.inventoryDao.adjustItemQuantity(profile.corpName, 'Solars', revenue);
    await ledger.recordRevenue(
      corpName: profile.corpName,
      turn: turn,
      amount: revenue,
      category: 'market',
      description: 'Commodity sales of $minedItem ($sellQty m³)',
    );

    // 2. Scientific R&D Actions (Veidt & Balanced focus)
    if (profile.focus == AiFocus.scientific || profile.focus == AiFocus.balanced) {
      final researchCost = 25000 + rng.nextInt(25000);
      if (solars >= researchCost) {
        await db.inventoryDao.adjustItemQuantity(profile.corpName, 'Solars', -researchCost);
        await ledger.recordExpense(
          corpName: profile.corpName,
          turn: turn,
          amount: researchCost,
          category: 'research',
          description: 'Applied laboratory R&D investment',
        );

        final trees = ['laser', 'sensors', 'shields', 'astrogation', 'shipBuilding'];
        final targetTree = trees[rng.nextInt(trees.length)];
        final cur = await db.researchDao.getResearchItem(profile.corpName, targetTree);
        if (cur != null) {
          final newProg = cur.progress + 150 + rng.nextInt(100);
          if (newProg >= cur.nextGoal) {
            await db.researchDao.upsertResearch(
              profile.corpName,
              targetTree,
              cur.level + 1,
              0,
              cur.nextGoal * 2,
            );
          } else {
            await db.researchDao.upsertResearch(
              profile.corpName,
              targetTree,
              cur.level,
              newProg,
              cur.nextGoal,
            );
          }
        }
      }
    }

    // 3. Fleet & Shipbuilding Actions (Tyrell & Military focus)
    if (profile.focus == AiFocus.shipbuilding || profile.focus == AiFocus.military) {
      final ships = await db.fleetDao.getCorpShips(profile.corpName);
      if (ships.length < 5 && solars >= 400000) {
        const shipCost = 350000;
        await db.inventoryDao.adjustItemQuantity(profile.corpName, 'Solars', -shipCost);
        await ledger.recordExpense(
          corpName: profile.corpName,
          turn: turn,
          amount: shipCost,
          category: 'fleet',
          description: 'Commissioned new escort corvette into fleet',
        );

        final shipNum = ships.length + 1;
        await db.into(db.fleet).insert(
              FleetCompanion.insert(
                corpName: Value(profile.corpName),
                shipName: '${profile.corpName} Vessel $shipNum',
                shipModel: const Value('Magpie'),
                squadron: const Value('Alpha Squadron'),
                shipClass: const Value('Corvette'),
                shipSize: const Value(1),
                value: const Value(350000),
                maxShipValue: const Value(350000),
                weap: const Value(1),
                armor: const Value(1),
                bays: const Value(0),
                cargo: const Value(20),
                engines: const Value(95),
                maneuv: const Value(95),
                weapCtrl: const Value(45),
                cloak: const Value(90),
                lifeSupp: const Value(20),
                maxCargo: const Value(20),
                maxEngines: const Value(95),
                maxManeuv: const Value(95),
                maxWeapCtrl: const Value(45),
                maxLifeSupp: const Value(20),
                hp: const Value(100),
                maxHp: const Value(100),
              ),
            );
      }
    }
  }

  /// Calculates total net worth and gathers statistics for a corporation
  Future<CorpLeaderboardEntry> calculateCorpStats({
    required String corpName,
    required bool isPlayer,
    required int turn,
  }) async {
    // 1. Solars
    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');

    // 2. Inventory Commodities Value
    final inv = await db.inventoryDao.getCorpInventory(corpName);
    var invValue = 0;
    for (final item in inv) {
      if (item.item != 'Solars') {
        final priceInfo = MarketPriceService.getPrice(commodity: item.item, turn: turn);
        invValue += (item.qty * priceInfo.sellPrice);
      }
    }

    // 3. Fleet Value
    final ships = await db.fleetDao.getCorpShips(corpName);
    final fleetValue = ships.fold<int>(0, (sum, s) => sum + s.value);

    // 4. Tech Level Sum
    final research = await db.researchDao.getCorpResearch(corpName);
    final techSum = research.fold<int>(0, (sum, r) => sum + r.level);
    final techValue = techSum * 75000;

    final netWorth = solars + invValue + fleetValue + techValue;

    final profile = rivalProfiles.where((r) => r.corpName == corpName).firstOrNull;
    final ceoName = isPlayer ? 'Executive Director' : (profile?.ceoName ?? 'Corporate CEO');
    final heritage = profile?.heritage ?? 'Earth';

    return CorpLeaderboardEntry(
      rank: 0,
      corpName: corpName,
      ceoName: ceoName,
      heritage: heritage,
      isPlayer: isPlayer,
      netWorth: netWorth,
      solars: solars,
      inventoryValue: invValue,
      fleetValue: fleetValue,
      techLevelSum: techSum,
      shipCount: ships.length,
    );
  }

  /// Gathers and ranks all 7 corporations (Player + 6 Rivals) by Net Worth
  Future<List<CorpLeaderboardEntry>> getRankedLeaderboard({
    required String playerCorp,
    required int turn,
  }) async {
    await ensureRivalsProvisioned();

    final allCorps = <CorpLeaderboardEntry>[];

    // Player stats
    final playerStats = await calculateCorpStats(
      corpName: playerCorp,
      isPlayer: true,
      turn: turn,
    );
    allCorps.add(playerStats);

    // AI Rivals stats
    for (final r in rivalProfiles) {
      if (r.corpName == playerCorp) continue;
      final aiStats = await calculateCorpStats(
        corpName: r.corpName,
        isPlayer: false,
        turn: turn,
      );
      allCorps.add(aiStats);
    }

    // Sort by Net Worth descending
    allCorps.sort((a, b) => b.netWorth.compareTo(a.netWorth));

    // Assign 1-indexed ranks
    final ranked = <CorpLeaderboardEntry>[];
    for (var i = 0; i < allCorps.length; i++) {
      final c = allCorps[i];
      ranked.add(
        CorpLeaderboardEntry(
          rank: i + 1,
          corpName: c.corpName,
          ceoName: c.ceoName,
          heritage: c.heritage,
          isPlayer: c.isPlayer,
          netWorth: c.netWorth,
          solars: c.solars,
          inventoryValue: c.inventoryValue,
          fleetValue: c.fleetValue,
          techLevelSum: c.techLevelSum,
          shipCount: c.shipCount,
        ),
      );
    }

    return ranked;
  }
}

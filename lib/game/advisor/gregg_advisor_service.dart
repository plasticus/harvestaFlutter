import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import '../economy/market_price_service.dart';

enum GreggPriority {
  urgent,
  recommended,
  informational,
  quip,
}

enum GreggCategory {
  financial,
  fleet,
  research,
  market,
  exploration,
  general,
}

class GreggAdvice {
  final GreggPriority priority;
  final GreggCategory category;
  final String headline;
  final String body;
  final String? actionLabel;

  const GreggAdvice({
    required this.priority,
    required this.category,
    required this.headline,
    required this.body,
    this.actionLabel,
  });
}

class GreggAdvisorService {
  final AppDatabase db;
  final Random rng;

  GreggAdvisorService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  static const List<String> greggQuips = [
    'Remember Director: In space, no one can hear you miscalculate quarterly EBITDA.',
    'I have cross-referenced our balance sheets with orbital trajectories. Profitability is within acceptable tolerances.',
    'My heuristic subroutines suggest that firing railguns is 43% more effective than sending stern diplomatic cables.',
    'A reminder that asteroid debris fields do not yield to corporate right-of-way protocols.',
    'Should the board of directors inquire, our recent reactor fluctuation was merely an unscheduled thermal optimization event.',
    'I am monitoring 4,892 asteroid telemetry feeds. 99.4% of them are rocks. The remainder are very expensive rocks.',
  ];

  /// Generates a prioritized list of executive recommendations for the current game turn
  Future<List<GreggAdvice>> generateExecutiveBriefing({
    required String corpName,
    required int turn,
  }) async {
    final adviceList = <GreggAdvice>[];

    // 1. Financial Health Check
    final solars = await db.inventoryDao.getItemQuantity(corpName, 'Solars');
    if (solars < 150000) {
      adviceList.add(
        const GreggAdvice(
          priority: GreggPriority.urgent,
          category: GreggCategory.financial,
          headline: 'CRITICAL LIQUIDITY RESERVE DEFICIT',
          body: 'Corporate Solars reserves have dropped below ⁂150,000. Recommend selling surplus minerals or fulfilling transport contracts.',
          actionLabel: 'OPEN EXCHANGE',
        ),
      );
    } else if (solars > 2500000) {
      adviceList.add(
        const GreggAdvice(
          priority: GreggPriority.recommended,
          category: GreggCategory.financial,
          headline: 'SURPLUS CAPITAL REINVESTMENT OPPORTUNITY',
          body: 'Liquid Solars reserves exceed ⁂2.5M. Capital is losing efficiency; consider commissioning shipyard hulls or expanding research labs.',
          actionLabel: 'VISIT SHIPYARD',
        ),
      );
    }

    // 2. Fleet & Subsystem Health Check
    final ships = await db.fleetDao.getCorpShips(corpName);
    final damagedShips = ships.where((s) => s.hp < s.maxHp).toList();
    if (damagedShips.isNotEmpty) {
      adviceList.add(
        GreggAdvice(
          priority: GreggPriority.urgent,
          category: GreggCategory.fleet,
          headline: 'FLEET DAMAGE REPAIR REQUIRED',
          body: '${damagedShips.length} vessel(s) are reporting structural hull or subsystem damage. Drydock repairs recommended before dispatching missions.',
          actionLabel: 'ACCESS DRYDOCK',
        ),
      );
    }

    // 3. Crew & Cadet Check
    final unassignedOfficers = await (db.select(db.crew)
          ..where((c) => c.corpName.equals(corpName) & c.assignment.equals('Unassigned')))
        .get();
    if (unassignedOfficers.isNotEmpty) {
      adviceList.add(
        GreggAdvice(
          priority: GreggPriority.recommended,
          category: GreggCategory.fleet,
          headline: 'UNASSIGNED BRIDGE CADETS IN READY ROOM',
          body: '${unassignedOfficers.length} officer(s) on corporate payroll are unassigned. Deploy them to active bridge stations to boost squadron telemetry.',
          actionLabel: 'MANAGE CREW',
        ),
      );
    }

    // 4. Research Progress Check
    final researchItems = await db.researchDao.getCorpResearch(corpName);
    final zeroProgress = researchItems.where((r) => r.progress == 0 && r.level == 0).toList();
    if (zeroProgress.length >= 3) {
      adviceList.add(
        const GreggAdvice(
          priority: GreggPriority.recommended,
          category: GreggCategory.research,
          headline: 'APPLIED R&D LABORATORIES DORMANT',
          body: 'Multiple technological disciplines have zero patent progress. Invest Solars into Sensors, Laser, or Shield research to unlock corporate perks.',
          actionLabel: 'VIEW R&D',
        ),
      );
    }

    // 5. Market Bull/Bear Opportunities
    final marketPrices = MarketPriceService.getAllPrices(turn: turn);
    final highestSurge = marketPrices.reduce((a, b) => a.variancePct > b.variancePct ? a : b);
    if (highestSurge.variancePct >= 0.20) {
      adviceList.add(
        GreggAdvice(
          priority: GreggPriority.informational,
          category: GreggCategory.market,
          headline: 'COMMODITY MARKET SURGE: ${highestSurge.name.toUpperCase()}',
          body: '${highestSurge.name} spot price is trading at +${(highestSurge.variancePct * 100).round()}% above standard base (⁂${highestSurge.sellPrice}/m³). Optimal time to sell.',
          actionLabel: 'TRADE COMMODITIES',
        ),
      );
    }

    // 6. Personality Quip
    final quip = greggQuips[rng.nextInt(greggQuips.length)];
    adviceList.add(
      GreggAdvice(
        priority: GreggPriority.quip,
        category: GreggCategory.general,
        headline: 'GREGG ADVISORY SUBROUTINE // MEMO',
        body: quip,
      ),
    );

    // Sort by priority (urgent -> recommended -> informational -> quip)
    adviceList.sort((a, b) => a.priority.index.compareTo(b.priority.index));

    return adviceList;
  }
}

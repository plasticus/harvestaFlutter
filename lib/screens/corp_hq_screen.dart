import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_state_provider.dart';
import '../providers/turn_actions_provider.dart';
import '../models/turn_result.dart';
import 'market_screen.dart';
import 'ledger_screen.dart';
import 'station_screen.dart';
import 'fleet_screen.dart';
import 'cadet_academy_screen.dart';
import 'mission_board_screen.dart';
import 'corporate_intelligence_screen.dart';
import 'codex_screen.dart';
import 'settings_screen.dart';
import '../game/advisor/gregg_advisor_service.dart';
import '../providers/database_provider.dart';

class CorpHqScreen extends ConsumerStatefulWidget {
  const CorpHqScreen({super.key});

  @override
  ConsumerState<CorpHqScreen> createState() => _CorpHqScreenState();
}

class _CorpHqScreenState extends ConsumerState<CorpHqScreen> {
  bool _isAdvancing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(gameStateProvider);
      if (state.corpName.isNotEmpty) {
        ref.read(turnActionsProvider.notifier).loadTurnActions(state.corpName, state.gameTurn);
      }
    });
  }

  Future<void> _handleAdvanceTurn() async {
    final state = ref.read(gameStateProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D1520),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF00D4FF)),
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Row(
          children: [
            Icon(Icons.fast_forward, color: Color(0xFF00D4FF)),
            SizedBox(width: 10),
            Text(
              'Advance Sector Cycle',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        content: Text(
          'Advance from Turn #${state.gameTurn} to Turn #${state.gameTurn + 1}?\n\n'
          '• Research progression will advance.\n'
          '• New mission contracts will generate.\n'
          '• Cadet academy candidates will cycle.\n'
          '• Action limits will reset.\n'
          '• AI competitors will execute their operations.',
          style: const TextStyle(color: Color(0xFFC8DFF0), fontSize: 13, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF5A7A9A))),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D4FF),
              foregroundColor: const Color(0xFF080C10),
            ),
            child: const Text('Advance Turn', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isAdvancing = true);

    try {
      final result = await ref.read(gameStateProvider.notifier).advanceTurn();
      ref.read(turnActionsProvider.notifier).resetForNewTurn();

      if (mounted) {
        _showTurnSummaryDialog(result);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to advance turn: $e'),
            backgroundColor: const Color(0xFFFF4D6A),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isAdvancing = false);
      }
    }
  }

  void _showTurnSummaryDialog(TurnResult result) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D1520),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF39FF98)),
          borderRadius: BorderRadius.circular(10),
        ),
        title: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Color(0xFF39FF98)),
            const SizedBox(width: 10),
            Text(
              'Cycle #${result.newTurn} Initialized',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
        content: SizedBox(
          width: 480,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF060A10),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF1A3050)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: result.logs.map((log) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        log,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Color(0xFFC8DFF0),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF39FF98),
              foregroundColor: const Color(0xFF080C10),
            ),
            child: const Text('Return to HQ', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);
    final actionsState = ref.watch(turnActionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          gameState.corpName.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF00D4FF),
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 18,
          ),
        ),
        actions: [
          // Turn Pill
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E30),
              border: Border.all(color: const Color(0xFF00D4FF)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'TURN #${gameState.gameTurn}',
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00D4FF),
              ),
            ),
          ),
          // Solars Treasury Pill (opens Ledger)
          InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LedgerScreen()),
            ),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF0F1E30),
                border: Border.all(color: const Color(0xFFFFB740)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.account_balance_wallet, size: 13, color: Color(0xFFFFB740)),
                  const SizedBox(width: 6),
                  Text(
                    '⁂ ${gameState.solars.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFB740),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xFF5A7A9A)),
            tooltip: 'System Settings & Diagnostics',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Gregg Advisor Banner
                _buildGreggAdvisorCard(gameState.gameTurn),
                const SizedBox(height: 20),

                // Action Readiness Section
                const Text(
                  'OPERATIONS READINESS',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    letterSpacing: 1.5,
                    color: Color(0xFF00D4FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildActionReadinessGrid(actionsState),
                const SizedBox(height: 28),

                // Sector Operations Navigation Cards
                const Text(
                  'SECTOR OPERATIONS',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    letterSpacing: 1.5,
                    color: Color(0xFF00D4FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildOperationsGrid(),
                const SizedBox(height: 36),

                // Advance Turn Action Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1520),
                    border: Border.all(color: const Color(0xFF1A3050)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: Color(0xFF5A7A9A), size: 22),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Ready to conclude your operations for this cycle? Advancing the turn updates research, refreshes contracts, and runs competitor intelligence.',
                          style: TextStyle(color: Color(0xFF5A7A9A), fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: _isAdvancing ? null : _handleAdvanceTurn,
                        icon: _isAdvancing
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF080C10),
                                ),
                              )
                            : const Icon(Icons.fast_forward),
                        label: Text(
                          _isAdvancing ? 'ADVANCING...' : 'ADVANCE TURN',
                          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D4FF),
                          foregroundColor: const Color(0xFF080C10),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreggAdvisorCard(int turn) {
    final gameState = ref.watch(gameStateProvider);
    final db = ref.read(databaseProvider);
    final advisorService = GreggAdvisorService(db);

    return FutureBuilder<List<GreggAdvice>>(
      future: advisorService.generateExecutiveBriefing(corpName: gameState.corpName, turn: turn),
      builder: (ctx, snapshot) {
        final adviceList = snapshot.data ?? [];
        final primaryAdvice = adviceList.firstOrNull;

        Color accentColor = const Color(0xFFFFB740);
        if (primaryAdvice?.priority == GreggPriority.urgent) accentColor = const Color(0xFFFF4D6A);
        if (primaryAdvice?.priority == GreggPriority.informational) accentColor = const Color(0xFF00D4FF);

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0D1520),
            border: Border.all(color: accentColor.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFF0F1E30),
                          radius: 20,
                          child: Icon(Icons.support_agent, color: accentColor, size: 24),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Gregg',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '— Corporate Executive Advisor',
                                    style: TextStyle(
                                      color: Color(0xFF5A7A9A),
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (primaryAdvice != null)
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: accentColor.withValues(alpha: 0.15),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        primaryAdvice.priority.name.toUpperCase(),
                                        style: TextStyle(fontFamily: 'monospace', fontSize: 9, fontWeight: FontWeight.bold, color: accentColor),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                primaryAdvice != null
                                    ? '"${primaryAdvice.body}"'
                                    : '"All corporate operations proceeding within optimal operating tolerances, Director."',
                                style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFFC8DFF0),
                                  fontSize: 13,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionReadinessGrid(TurnActionsState actions) {
    final items = [
      (label: 'Radar Sweep', done: actions.scanDone, icon: Icons.radar),
      (label: 'Asteroid Mine', done: actions.mineDone, icon: Icons.terrain),
      (label: 'Tech Research', done: actions.researchDone, icon: Icons.science),
      (label: 'Cadet Hire', done: actions.cadetsDone, icon: Icons.school),
      (label: 'Mission Dispatch', done: actions.expeditionDone, icon: Icons.rocket),
      (label: 'Market Trade', done: actions.marketDone, icon: Icons.currency_exchange),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.1,
      ),
      itemCount: items.length,
      itemBuilder: (context, idx) {
        final it = items[idx];
        final isDone = it.done;

        return InkWell(
          onTap: () {
            if (it.label == 'Radar Sweep') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StationScreen(initialTabIndex: 0)));
            } else if (it.label == 'Asteroid Mine') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StationScreen(initialTabIndex: 1)));
            } else if (it.label == 'Tech Research') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const StationScreen(initialTabIndex: 2)));
            } else if (it.label == 'Market Trade') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MarketScreen()));
            } else if (it.label == 'Cadet Hire') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CadetAcademyScreen(initialTabIndex: 1)));
            } else if (it.label == 'Mission Dispatch') {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MissionBoardScreen()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${it.label} will unlock in its respective phase.'), duration: const Duration(seconds: 1)),
              );
            }
          },
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1520),
              border: Border.all(
                color: isDone ? const Color(0xFF5A7A9A).withValues(alpha: 0.3) : const Color(0xFF39FF98).withValues(alpha: 0.5),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Icon(
                  it.icon,
                  size: 20,
                  color: isDone ? const Color(0xFF5A7A9A) : const Color(0xFF39FF98),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        it.label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isDone ? const Color(0xFF5A7A9A) : Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        isDone ? 'COMPLETED' : 'AVAILABLE',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 9,
                          color: isDone ? const Color(0xFF5A7A9A) : const Color(0xFF39FF98),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOperationsGrid() {
    final modules = [
      (
        title: 'Station & Facilities',
        sub: 'Radar sweep, mineral extraction, laboratory research, drydock',
        icon: Icons.satellite_alt,
        color: const Color(0xFF00D4FF),
      ),
      (
        title: 'Fleet & Vessels',
        sub: 'Squadron status, module fittings, repair drydock, purchase ships',
        icon: Icons.rocket_launch,
        color: const Color(0xFFFFB740),
      ),
      (
        title: 'Commodity Exchange',
        sub: 'Live market prices, 7-resource commodities, financial ledger',
        icon: Icons.candlestick_chart,
        color: const Color(0xFF39FF98),
      ),
      (
        title: 'Mission Terminal',
        sub: 'Contract board, waypoint expeditions, sector interruptor events',
        icon: Icons.assignment,
        color: const Color(0xFFFF8A2B),
      ),
      (
        title: 'Corporate Intelligence',
        sub: 'Sector leaderboards, rival corporation monitoring, net worth graph',
        icon: Icons.leaderboard,
        color: const Color(0xFFC084FC),
      ),
      (
        title: 'Sector Codex',
        sub: 'Ship blueprints, module catalog, tech tree encyclopedia',
        icon: Icons.menu_book,
        color: const Color(0xFF5A7A9A),
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 2.4,
      ),
      itemCount: modules.length,
      itemBuilder: (context, idx) {
        final m = modules[idx];
        return InkWell(
          onTap: () {
            if (m.title == 'Fleet & Vessels') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FleetScreen(initialTabIndex: 0)),
              );
            } else if (m.title == 'Shipyard & Drydock') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const FleetScreen(initialTabIndex: 2)),
              );
            } else if (m.title == 'Crew & Cadets') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CadetAcademyScreen(initialTabIndex: 0)),
              );
            } else if (m.title == 'Station & Facilities') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const StationScreen()),
              );
            } else if (m.title == 'Commodity Exchange') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MarketScreen()),
              );
            } else if (m.title == 'Mission Terminal') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const MissionBoardScreen()),
              );
            } else if (m.title == 'Corporate Intelligence') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CorporateIntelligenceScreen()),
              );
            } else if (m.title == 'Sector Codex') {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CodexScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${m.title} will unlock in its respective phase.'),
                  duration: const Duration(seconds: 1),
                ),
              );
            }
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1520),
              border: Border.all(color: const Color(0xFF1A3050)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: m.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(m.icon, color: m.color, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        m.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        m.sub,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF5A7A9A),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

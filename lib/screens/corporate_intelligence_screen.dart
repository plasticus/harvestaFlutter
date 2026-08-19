import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../game/ai/ai_corp_service.dart';

class CorporateIntelligenceScreen extends ConsumerStatefulWidget {
  const CorporateIntelligenceScreen({super.key});

  @override
  ConsumerState<CorporateIntelligenceScreen> createState() => _CorporateIntelligenceScreenState();
}

class _CorporateIntelligenceScreenState extends ConsumerState<CorporateIntelligenceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  List<CorpLeaderboardEntry> _leaderboard = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadIntelligenceData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadIntelligenceData() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    final db = ref.read(databaseProvider);
    final aiService = AiCorpService(db);
    final ranked = await aiService.getRankedLeaderboard(
      playerCorp: gameState.corpName,
      turn: gameState.gameTurn,
    );

    if (mounted) {
      setState(() {
        _leaderboard = ranked;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CORPORATE INTELLIGENCE & LEADERBOARDS'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00D4FF),
          labelColor: const Color(0xFF00D4FF),
          unselectedLabelColor: const Color(0xFF5A7A9A),
          tabs: const [
            Tab(icon: Icon(Icons.leaderboard), text: 'Sector Rankings'),
            Tab(icon: Icon(Icons.show_chart), text: 'Net Worth Trends'),
            Tab(icon: Icon(Icons.business), text: 'Rival Dossiers'),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E30),
              border: Border.all(color: const Color(0xFFFFB740)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '⁂ ${gameState.solars.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} Solars',
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFB740),
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF00D4FF)))
          : TabBarView(
              controller: _tabController,
              children: [
                _buildLeaderboardTab(),
                _buildNetWorthTrendsTab(),
                _buildRivalDossiersTab(),
              ],
            ),
    );
  }

  // 1. Leaderboard Rankings View
  Widget _buildLeaderboardTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1520),
            border: Border.all(color: const Color(0xFF1A3050)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            children: [
              Icon(Icons.public, color: Color(0xFF00D4FF), size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SOL SYSTEM CORPORATE STANDINGS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                    SizedBox(height: 2),
                    Text(
                      'Rankings calculated from liquid Solars, raw commodity stockpiles, active fleet assets, and patent tech value.',
                      style: TextStyle(fontSize: 11, color: Color(0xFF5A7A9A)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ..._leaderboard.map((corp) => _buildCorpRankCard(corp)),
      ],
    );
  }

  Widget _buildCorpRankCard(CorpLeaderboardEntry corp) {
    Color rankBadgeColor = const Color(0xFF5A7A9A);
    if (corp.rank == 1) rankBadgeColor = const Color(0xFFFFD700);
    if (corp.rank == 2) rankBadgeColor = const Color(0xFFC0C0C0);
    if (corp.rank == 3) rankBadgeColor = const Color(0xFFCD7F32);

    final isPlayer = corp.isPlayer;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isPlayer ? const Color(0xFF0F1E30) : const Color(0xFF0D1520),
        border: Border.all(
          color: isPlayer ? const Color(0xFF00D4FF) : const Color(0xFF1A3050),
          width: isPlayer ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Rank Badge
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: rankBadgeColor.withValues(alpha: 0.15),
              border: Border.all(color: rankBadgeColor),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '#${corp.rank}',
                style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 13, color: rankBadgeColor),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Corp Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      corp.corpName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: isPlayer ? const Color(0xFF00D4FF) : Colors.white,
                      ),
                    ),
                    if (isPlayer) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(color: const Color(0xFF00D4FF).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(4)),
                        child: const Text('YOU', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF))),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  '${corp.ceoName} | ${corp.heritage} | Fleet: ${corp.shipCount} ships | Tech: L${corp.techLevelSum}',
                  style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A)),
                ),
              ],
            ),
          ),
          // Net Worth
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '⁂ ${corp.netWorth.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFFFB740)),
              ),
              const Text('NET WORTH', style: TextStyle(fontSize: 9, fontFamily: 'monospace', color: Color(0xFF5A7A9A))),
            ],
          ),
        ],
      ),
    );
  }

  // 2. Net Worth Progression Analytics View
  Widget _buildNetWorthTrendsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1520),
            border: Border.all(color: const Color(0xFF1A3050)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SYSTEM NET WORTH COMPARATIVE DISTRIBUTION',
                style: TextStyle(fontFamily: 'monospace', fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF)),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 260,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: _leaderboard.fold<int>(0, (maxVal, c) => max(maxVal, c.netWorth)) * 1.25,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (val, meta) {
                            final idx = val.toInt();
                            if (idx < 0 || idx >= _leaderboard.length) return const SizedBox.shrink();
                            final name = _leaderboard[idx].corpName;
                            final shortName = name.length > 8 ? name.substring(0, 8) : name;
                            return Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(shortName, style: const TextStyle(fontSize: 9, color: Color(0xFF5A7A9A), fontFamily: 'monospace')),
                            );
                          },
                        ),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: _leaderboard.asMap().entries.map((e) {
                      final idx = e.key;
                      final corp = e.value;
                      return BarChartGroupData(
                        x: idx,
                        barRods: [
                          BarChartRodData(
                            toY: corp.netWorth.toDouble(),
                            color: corp.isPlayer ? const Color(0xFF00D4FF) : const Color(0xFFFFB740),
                            width: 18,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 3. Rival Dossiers View
  Widget _buildRivalDossiersTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: AiCorpService.rivalProfiles.map((p) {
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1520),
            border: Border.all(color: const Color(0xFF1A3050)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFF0F1E30),
                        radius: 20,
                        child: Text(p.corpName[0], style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00D4FF))),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.corpName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                          Text('CEO: ${p.ceoName} | Heritage: ${p.heritage}', style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF060A10),
                      border: Border.all(color: const Color(0xFF00D4FF).withValues(alpha: 0.3)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      p.focus.name.toUpperCase(),
                      style: const TextStyle(fontSize: 10, fontFamily: 'monospace', fontWeight: FontWeight.bold, color: Color(0xFF00D4FF)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('"${p.motto}"', style: const TextStyle(fontStyle: FontStyle.italic, color: Color(0xFFFFB740), fontSize: 11)),
              const SizedBox(height: 6),
              Text(p.description, style: const TextStyle(fontSize: 12, color: Color(0xFFC8DFF0))),
            ],
          ),
        );
      }).toList(),
    );
  }
}

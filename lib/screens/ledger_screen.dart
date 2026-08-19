import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../game/economy/ledger_service.dart';
import '../data/app_database.dart';

class LedgerScreen extends ConsumerStatefulWidget {
  const LedgerScreen({super.key});

  @override
  ConsumerState<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends ConsumerState<LedgerScreen> {
  List<CorpFinanceLedgerEntry> _history = [];
  CorpValuationSummary? _valuations;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLedgerData();
  }

  Future<void> _loadLedgerData() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    final db = ref.read(databaseProvider);
    final ledgerService = LedgerService(db);

    final history = await db.ledgerDao.getLedgerHistory(gameState.corpName);
    final valuations = await ledgerService.calculateValuations(gameState.corpName);

    if (mounted) {
      setState(() {
        _history = history;
        _valuations = valuations;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CORPORATE FINANCIAL LEDGER'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadLedgerData,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Color(0xFF00D4FF)))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header title
                      Text(
                        '${gameState.corpName.toUpperCase()} // AUDIT & VALUATION',
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Color(0xFF00D4FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Metric Cards Row
                      if (_valuations != null) _buildValuationMetricsGrid(_valuations!),
                      const SizedBox(height: 28),

                      // Historical Line Chart
                      const Text(
                        'HISTORICAL NET WORTH & TREASURY TRAJECTORY',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Color(0xFF00D4FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildTrajectoryChart(),
                      const SizedBox(height: 28),

                      // Historical Table Breakdown
                      const Text(
                        'TURN CYCLE AUDIT LOGS',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          letterSpacing: 1.5,
                          color: Color(0xFF00D4FF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildHistoryTable(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildValuationMetricsGrid(CorpValuationSummary v) {
    return GridView.count(
      crossAxisCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1.8,
      children: [
        _buildMetricCard('NET WORTH', '⁂${_formatNum(v.totalNetWorth)}', const Color(0xFF00D4FF), Icons.account_balance),
        _buildMetricCard('TREASURY SOLARS', '⁂${_formatNum(v.treasurySolars)}', const Color(0xFFFFB740), Icons.payments),
        _buildMetricCard('FLEET ASSETS', '⁂${_formatNum(v.fleetValue)}', const Color(0xFF39FF98), Icons.rocket_launch),
        _buildMetricCard('STORED MATERIALS', '⁂${_formatNum(v.materialValue)}', const Color(0xFFFF8A2B), Icons.inventory_2),
        _buildMetricCard('CYCLE PAYROLL', '-⁂${_formatNum(v.estimatedPayroll)}', const Color(0xFFFF4D6A), Icons.people),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1520),
        border: Border.all(color: const Color(0xFF1A3050)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFF5A7A9A)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              color: color,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildTrajectoryChart() {
    if (_history.isEmpty) {
      return Container(
        height: 220,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF0D1520),
          border: Border.all(color: const Color(0xFF1A3050)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('No ledger history recorded yet.', style: TextStyle(color: Color(0xFF5A7A9A))),
      );
    }

    final netWorthSpots = _history.map((h) => FlSpot(h.gameTurn.toDouble(), h.netWorth.toDouble())).toList();
    final solarsSpots = _history.map((h) => FlSpot(h.gameTurn.toDouble(), h.solars.toDouble())).toList();

    return Container(
      height: 240,
      padding: const EdgeInsets.only(right: 20, left: 10, top: 20, bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1520),
        border: Border.all(color: const Color(0xFF1A3050)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (_) => const FlLine(color: Color(0xFF1A3050), strokeWidth: 1),
            getDrawingVerticalLine: (_) => const FlLine(color: Color(0xFF1A3050), strokeWidth: 1),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                getTitlesWidget: (val, meta) => Text(
                  '${(val / 1000).round()}k',
                  style: const TextStyle(fontSize: 9, color: Color(0xFF5A7A9A), fontFamily: 'monospace'),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (val, meta) => Text(
                  'T${val.toInt()}',
                  style: const TextStyle(fontSize: 10, color: Color(0xFF5A7A9A), fontFamily: 'monospace'),
                ),
              ),
            ),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Net Worth Line
            LineChartBarData(
              spots: netWorthSpots,
              isCurved: false,
              color: const Color(0xFF00D4FF),
              barWidth: 3,
              dotData: const FlDotData(show: true),
            ),
            // Solars Line
            LineChartBarData(
              spots: solarsSpots,
              isCurved: false,
              color: const Color(0xFFFFB740),
              barWidth: 2,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTable() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D1520),
        border: Border.all(color: const Color(0xFF1A3050)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(65),
          1: FlexColumnWidth(1.2),
          2: FlexColumnWidth(1.2),
          3: FlexColumnWidth(1.0),
          4: FlexColumnWidth(1.0),
          5: FlexColumnWidth(2.0),
        },
        children: [
          // Table Header
          TableRow(
            decoration: const BoxDecoration(
              color: Color(0xFF060A10),
              border: Border(bottom: BorderSide(color: Color(0xFF1A3050))),
            ),
            children: [
              _buildTableHeaderCell('TURN'),
              _buildTableHeaderCell('NET WORTH'),
              _buildTableHeaderCell('SOLARS'),
              _buildTableHeaderCell('REVENUE'),
              _buildTableHeaderCell('EXPENSES'),
              _buildTableHeaderCell('ACTIVITY NOTES'),
            ],
          ),
          // Table Rows
          ..._history.reversed.map((row) {
            return TableRow(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFF132235))),
              ),
              children: [
                _buildTableCell('T#${row.gameTurn}', color: const Color(0xFF00D4FF)),
                _buildTableCell('⁂${_formatNum(row.netWorth)}', color: Colors.white),
                _buildTableCell('⁂${_formatNum(row.solars)}', color: const Color(0xFFFFB740)),
                _buildTableCell('+⁂${_formatNum(row.revenue)}', color: const Color(0xFF39FF98)),
                _buildTableCell('-⁂${_formatNum(row.expenses)}', color: const Color(0xFFFF4D6A)),
                _buildTableCell(row.notes ?? 'Turn Close Snapshot', color: const Color(0xFFC8DFF0)),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTableHeaderCell(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Color(0xFF5A7A9A),
        ),
      ),
    );
  }

  Widget _buildTableCell(String text, {required Color color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 11,
          color: color,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String _formatNum(int num) {
    return num.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},");
  }
}

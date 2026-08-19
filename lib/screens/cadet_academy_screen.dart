import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../providers/turn_actions_provider.dart';
import '../game/fleet/crew_service.dart';
import '../data/app_database.dart';

class CadetAcademyScreen extends ConsumerStatefulWidget {
  final int initialTabIndex;
  const CadetAcademyScreen({super.key, this.initialTabIndex = 0});

  @override
  ConsumerState<CadetAcademyScreen> createState() => _CadetAcademyScreenState();
}

class _CadetAcademyScreenState extends ConsumerState<CadetAcademyScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  List<CrewMember> _officers = [];
  List<Cadet> _cadets = [];
  int _totalPayroll = 0;
  bool _isHiring = false;
  int _tradeLevel = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialTabIndex);
    _loadAcademyData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadAcademyData() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    final db = ref.read(databaseProvider);
    final crewService = CrewService(db);

    final officers = await db.crewDao.getCorpCrew(gameState.corpName);
    final cadets = await (db.select(db.cadets)).get();
    final payroll = await crewService.calculatePayroll(gameState.corpName);
    final trTech = await db.researchDao.getResearchItem(gameState.corpName, 'tradeRelationships');

    if (mounted) {
      setState(() {
        _officers = officers;
        _cadets = cadets;
        _totalPayroll = payroll;
        _tradeLevel = trTech?.level ?? 0;
        _isLoading = false;
      });
    }
  }

  Future<void> _handleHireCadet(Cadet cadet) async {
    final gameState = ref.read(gameStateProvider);
    setState(() => _isHiring = true);

    try {
      final db = ref.read(databaseProvider);
      final crewService = CrewService(db);
      await crewService.hireCadet(
        corpName: gameState.corpName,
        cadetId: cadet.id,
        turn: gameState.gameTurn,
      );

      await ref.read(gameStateProvider.notifier).refreshSolars();
      await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'cadets');
      await _loadAcademyData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🎖️ Cadet ${cadet.name} commissioned into active service!'),
            backgroundColor: const Color(0xFF39FF98),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hiring error: $e'), backgroundColor: const Color(0xFFFF4D6A)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isHiring = false);
      }
    }
  }

  Future<void> _toggleResearchAssignment(CrewMember officer) async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final crewService = CrewService(db);

    final newAssignment = officer.assignment == 'Research' ? 'Unassigned' : 'Research';
    await crewService.setOfficerTask(
      corpName: gameState.corpName,
      officerId: officer.id,
      assignment: newAssignment,
    );

    await _loadAcademyData();
  }

  @override
  Widget build(BuildContext context) {
    final actions = ref.watch(turnActionsProvider);
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEET PERSONNEL & CADET ACADEMY'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00D4FF),
          labelColor: const Color(0xFF00D4FF),
          unselectedLabelColor: const Color(0xFF5A7A9A),
          tabs: [
            Tab(icon: const Icon(Icons.badge), text: 'Active Officers (${_officers.length})'),
            Tab(icon: const Icon(Icons.school), text: actions.cadetsDone ? 'Cadet Board (Done)' : 'Cadet Recruitment (${_cadets.length})'),
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
                _buildActiveOfficersTab(),
                _buildCadetBoardTab(),
              ],
            ),
    );
  }

  // 1. Active Officers View
  Widget _buildActiveOfficersTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Payroll Banner
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1520),
            border: Border.all(color: const Color(0xFF1A3050)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.payments, color: Color(0xFFFFB740), size: 22),
                  SizedBox(width: 10),
                  Text('CORPORATE PAYROLL EXPENSES', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                ],
              ),
              Text(
                '⁂ ${_totalPayroll.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} / Turn',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFFFB740)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Officers List
        ..._officers.map((officer) {
          final isResearch = officer.assignment == 'Research';
          final hasShip = (officer.shipName ?? '').isNotEmpty;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
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
                          radius: 18,
                          child: Text(officer.name.isNotEmpty ? officer.name[0] : 'O',
                              style: const TextStyle(color: Color(0xFF00D4FF), fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Officer ${officer.name}',
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                            Text(
                              hasShip
                                  ? '${officer.assignment} aboard ${officer.shipName} (${officer.squadron})'
                                  : (isResearch ? 'Assigned to R&D Science Laboratory' : 'Standby / Unassigned'),
                              style: TextStyle(
                                fontSize: 11,
                                color: isResearch ? const Color(0xFF00D4FF) : (hasShip ? const Color(0xFF39FF98) : const Color(0xFF5A7A9A)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    OutlinedButton.icon(
                      onPressed: hasShip ? null : () => _toggleResearchAssignment(officer),
                      icon: Icon(isResearch ? Icons.science_outlined : Icons.science, size: 14),
                      label: Text(isResearch ? 'UNASSIGN LAB' : 'ASSIGN TO LAB', style: const TextStyle(fontSize: 10)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: isResearch ? const Color(0xFFFFB740) : const Color(0xFF00D4FF),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // 8 Skill badges
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _buildSkillBadge('Ldr', officer.leadership, const Color(0xFFFBBF24)),
                    _buildSkillBadge('Inf', officer.influence, const Color(0xFFC084FC)),
                    _buildSkillBadge('Plt', officer.pilot, const Color(0xFF38BDF8)),
                    _buildSkillBadge('Cmp', officer.computation, const Color(0xFF00D4FF)),
                    _buildSkillBadge('Rep', officer.repair, const Color(0xFF94A3B8)),
                    _buildSkillBadge('Wpn', officer.shipWeapons, const Color(0xFFF87171)),
                    _buildSkillBadge('Fgt', officer.fighting, const Color(0xFFFB923C)),
                    _buildSkillBadge('Ath', officer.athletics, const Color(0xFF34D399)),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // 2. Cadet Board View
  Widget _buildCadetBoardTab() {
    if (_cadets.isEmpty) {
      return const Center(child: Text('No cadet candidates in the academy this cycle.', style: TextStyle(color: Color(0xFF5A7A9A))));
    }

    final db = ref.read(databaseProvider);
    final crewService = CrewService(db);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _cadets.length,
      itemBuilder: (ctx, idx) {
        final cadet = _cadets[idx];
        final fee = crewService.calculateCadetFee(cadet, _tradeLevel);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
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
                      const CircleAvatar(
                        backgroundColor: Color(0xFF0F1E30),
                        radius: 18,
                        child: Icon(Icons.school, color: Color(0xFFFFB740), size: 18),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cadet ${cadet.name}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                          Text('Status: ${cadet.status}', style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: _isHiring ? null : () => _handleHireCadet(cadet),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF39FF98),
                      foregroundColor: const Color(0xFF080C10),
                    ),
                    child: Text(
                      'COMMISSION (⁂${fee.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")})',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _buildSkillBadge('Ldr', cadet.leadership, const Color(0xFFFBBF24)),
                  _buildSkillBadge('Inf', cadet.influence, const Color(0xFFC084FC)),
                  _buildSkillBadge('Plt', cadet.pilot, const Color(0xFF38BDF8)),
                  _buildSkillBadge('Cmp', cadet.computation, const Color(0xFF00D4FF)),
                  _buildSkillBadge('Rep', cadet.repair, const Color(0xFF94A3B8)),
                  _buildSkillBadge('Wpn', cadet.shipWeapons, const Color(0xFFF87171)),
                  _buildSkillBadge('Fgt', cadet.firearms + cadet.melee, const Color(0xFFFB923C)),
                  _buildSkillBadge('Ath', cadet.athletics, const Color(0xFF34D399)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkillBadge(String name, int score, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF060A10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: const TextStyle(fontSize: 10, color: Color(0xFF5A7A9A))),
          const SizedBox(width: 4),
          Text('$score', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color, fontFamily: 'monospace')),
        ],
      ),
    );
  }
}

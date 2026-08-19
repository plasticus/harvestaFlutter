import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../providers/turn_actions_provider.dart';
import '../game/station/scanning_service.dart';
import '../game/station/mining_service.dart';
import '../game/station/research_service.dart';
import '../game/station/station_service.dart';
import '../data/app_database.dart';
import '../widgets/orbital_radar_scope.dart';

class StationScreen extends ConsumerStatefulWidget {
  final int initialTabIndex;
  const StationScreen({super.key, this.initialTabIndex = 0});

  @override
  ConsumerState<StationScreen> createState() => _StationScreenState();
}

class _StationScreenState extends ConsumerState<StationScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  // Scanning State
  List<Asteroid> _scannedAsteroids = [];
  bool _isScanning = false;

  // Mining State
  String? _selectedAsteroidName;
  final String _selectedSquadron = 'Alpha Squadron';
  int _squadronCapacity = 0;
  bool _isMining = false;

  // Research State
  List<CorpResearchItem> _researchList = [];
  String _selectedResearchType = 'asteroidMining';
  int _dailyRP = 0;
  bool _isResearching = false;

  // Station State
  List<BuildingInfo> _buildings = [];
  bool _isUpgrading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.initialTabIndex);
    _loadAllStationData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadAllStationData() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    final db = ref.read(databaseProvider);
    final scanningService = ScanningService(db);
    final miningService = MiningService(db);
    final researchService = ResearchService(db);
    final stationService = StationService(db);

    final scanned = await scanningService.getCurrentScannedAsteroids(gameState.corpName);
    final capacity = await miningService.calculateSquadronCapacity(gameState.corpName, _selectedSquadron);
    final research = await db.researchDao.getCorpResearch(gameState.corpName);
    final rp = await researchService.calculateDailyRP(gameState.corpName, _selectedResearchType);
    final buildings = await stationService.getStationBuildings(gameState.corpName);

    if (mounted) {
      setState(() {
        _scannedAsteroids = scanned;
        if (scanned.isNotEmpty && _selectedAsteroidName == null) {
          _selectedAsteroidName = scanned.first.asteroidName;
        }
        _squadronCapacity = capacity;
        _researchList = research;
        _dailyRP = rp;
        _buildings = buildings;
        _isLoading = false;
      });
    }
  }

  Future<void> _handleRadarSweep() async {
    final gameState = ref.read(gameStateProvider);
    setState(() => _isScanning = true);

    try {
      final db = ref.read(databaseProvider);
      final scanningService = ScanningService(db);
      final result = await scanningService.executeRadarSweep(gameState.corpName, gameState.gameTurn);

      await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'scan');
      await _loadAllStationData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Radar Sweep Complete! Discovered ${result.discoveredAsteroids.length} candidate asteroid deposits (${result.totalM3} m³).'),
            backgroundColor: const Color(0xFF00D4FF),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Scan error: $e'), backgroundColor: const Color(0xFFFF4D6A)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isScanning = false);
      }
    }
  }

  Future<void> _handleMining() async {
    if (_selectedAsteroidName == null) return;
    final gameState = ref.read(gameStateProvider);
    setState(() => _isMining = true);

    try {
      final db = ref.read(databaseProvider);
      final miningService = MiningService(db);
      final result = await miningService.executeMining(
        corpName: gameState.corpName,
        squadron: _selectedSquadron,
        asteroidName: _selectedAsteroidName!,
      );

      await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'mine');
      await _loadAllStationData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Extraction Successful! Recovered ${result.totalYieldM3} m³ refined minerals with ${(result.efficiency * 100).round()}% refinery efficiency.',
            ),
            backgroundColor: const Color(0xFF39FF98),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Mining error: $e'), backgroundColor: const Color(0xFFFF4D6A)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isMining = false);
      }
    }
  }

  Future<void> _handleResearch() async {
    final gameState = ref.read(gameStateProvider);
    setState(() => _isResearching = true);

    try {
      final db = ref.read(databaseProvider);
      final researchService = ResearchService(db);
      final result = await researchService.executeResearchCycle(
        corpName: gameState.corpName,
        researchType: _selectedResearchType,
      );

      await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'research');
      await _loadAllStationData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.leveledUp
                  ? '🎉 R&D Breakthrough! ${result.techName} reached Level ${result.newLevel}!'
                  : 'Research Cycle Complete: +${result.rpGained} RP added to ${result.techName}.',
            ),
            backgroundColor: result.leveledUp ? const Color(0xFFFFB740) : const Color(0xFF00D4FF),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Research error: $e'), backgroundColor: const Color(0xFFFF4D6A)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isResearching = false);
      }
    }
  }

  Future<void> _handleUpgradeBuilding(String buildingType) async {
    final gameState = ref.read(gameStateProvider);
    setState(() => _isUpgrading = true);

    try {
      final db = ref.read(databaseProvider);
      final stationService = StationService(db);
      await stationService.upgradeBuilding(
        corpName: gameState.corpName,
        buildingType: buildingType,
        turn: gameState.gameTurn,
      );

      await ref.read(gameStateProvider.notifier).refreshSolars();
      await _loadAllStationData();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$buildingType facility upgraded successfully!'),
            backgroundColor: const Color(0xFF39FF98),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e'), backgroundColor: const Color(0xFFFF4D6A)),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isUpgrading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final actions = ref.watch(turnActionsProvider);
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('STATION OPERATIONS & FACILITIES'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00D4FF),
          labelColor: const Color(0xFF00D4FF),
          unselectedLabelColor: const Color(0xFF5A7A9A),
          tabs: [
            Tab(icon: const Icon(Icons.radar), text: actions.scanDone ? 'Radar (Done)' : 'Radar Sweep'),
            Tab(icon: const Icon(Icons.terrain), text: actions.mineDone ? 'Mining (Done)' : 'Asteroid Mining'),
            Tab(icon: const Icon(Icons.science), text: actions.researchDone ? 'R&D (Done)' : 'Laboratory'),
            const Tab(icon: Icon(Icons.apartment), text: 'Facilities'),
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
                _buildRadarSweepTab(actions.scanDone),
                _buildMiningTab(actions.mineDone),
                _buildResearchTab(actions.researchDone),
                _buildFacilitiesTab(),
              ],
            ),
    );
  }

  // 1. Radar Sweep Tab
  Widget _buildRadarSweepTab(bool isDone) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1520),
                  border: Border.all(color: const Color(0xFF00D4FF).withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.radar, color: Color(0xFF00D4FF), size: 28),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LONG-RANGE ORBITAL SENSOR ARRAY',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Sweep nearby sector coordinates to discover prospectable asteroids with high mineral and gas densities.',
                            style: TextStyle(fontSize: 12, color: Color(0xFF5A7A9A)),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: isDone || _isScanning ? null : _handleRadarSweep,
                      icon: _isScanning
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.search),
                      label: Text(isDone ? 'SWEEP COMPLETED' : 'EXECUTE SWEEP'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D4FF),
                        foregroundColor: const Color(0xFF080C10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 2D Tactical Orbital Radar Scope
              if (_scannedAsteroids.isNotEmpty) ...[
                const Text(
                  '2D TACTICAL ORBITAL RADAR MAP',
                  style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                OrbitalRadarScope(
                  asteroids: _scannedAsteroids,
                  selectedAsteroidName: _selectedAsteroidName,
                  onSelectAsteroid: (a) {
                    setState(() {
                      _selectedAsteroidName = a.asteroidName;
                    });
                  },
                  onMineSelected: () {
                    _tabController.animateTo(1);
                  },
                ),
                const SizedBox(height: 24),
              ],

              // Scanned Asteroids List
              Text(
                'SURVEYED ASTEROID SIGNATURES (${_scannedAsteroids.length})',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (_scannedAsteroids.isEmpty)
                Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1520),
                    border: Border.all(color: const Color(0xFF1A3050)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('No asteroids surveyed in this sector. Execute a radar sweep above.', style: TextStyle(color: Color(0xFF5A7A9A))),
                )
              else
                ..._scannedAsteroids.map((a) => _buildAsteroidCard(a)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAsteroidCard(Asteroid a) {
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
                  const Text('🪐', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Text(
                    a.asteroidName,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              Text(
                'Total Volume: ${a.m3} m³',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFFFFB740), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: [
              _buildOreBadge('Surface Metals', '${a.surfaceM} m³', const Color(0xFF94A3B8)),
              _buildOreBadge('Zero-G Metals', '${a.zeroGM} m³', const Color(0xFF38BDF8)),
              _buildOreBadge('Conductive', '${a.conductiveM} m³', const Color(0xFFFBBF24)),
              _buildOreBadge('Life Support', '${a.lifeSuppG} m³', const Color(0xFF34D399)),
              _buildOreBadge('Fuel Gases', '${a.fuelG} m³', const Color(0xFFF87171)),
              _buildOreBadge('OVE', '${a.ove} m³', const Color(0xFFC084FC)),
              _buildOreBadge('Water Ice', '${a.waterIce} m³', const Color(0xFF67E8F9)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOreBadge(String label, String qty, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF060A10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF5A7A9A))),
          const SizedBox(width: 4),
          Text(qty, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: color, fontFamily: 'monospace')),
        ],
      ),
    );
  }

  // 2. Mining Tab
  Widget _buildMiningTab(bool isDone) {
    final selectedAsteroid = _scannedAsteroids.where((a) => a.asteroidName == _selectedAsteroidName).firstOrNull;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Target Selection Row
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1520),
                  border: Border.all(color: const Color(0xFFFFB740).withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('EXTRACTION DISPATCH CONTROLS', style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            initialValue: _selectedAsteroidName,
                            decoration: const InputDecoration(
                              labelText: 'Target Asteroid Deposit',
                              filled: true,
                              fillColor: Color(0xFF060A10),
                              border: OutlineInputBorder(),
                            ),
                            items: _scannedAsteroids.map((a) {
                              return DropdownMenuItem(value: a.asteroidName, child: Text('${a.asteroidName} (${a.m3} m³)'));
                            }).toList(),
                            onChanged: (val) => setState(() => _selectedAsteroidName = val),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF060A10),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFF1A3050)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('SQUADRON CAPACITY', style: TextStyle(fontSize: 10, color: Color(0xFF5A7A9A), fontFamily: 'monospace')),
                              Text('$_squadronCapacity m³', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF), fontFamily: 'monospace')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Selected Asteroid Details
              if (selectedAsteroid != null) ...[
                _buildAsteroidCard(selectedAsteroid),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: (isDone || _isMining || _squadronCapacity <= 0) ? null : _handleMining,
                    icon: _isMining
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.terrain),
                    label: Text(isDone ? 'EXTRACTION COMPLETED FOR THIS TURN' : 'DEPLOY EXTRACTION SQUADRON'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF39FF98),
                      foregroundColor: const Color(0xFF080C10),
                    ),
                  ),
                ),
              ] else ...[
                const Center(child: Text('Please survey and select an asteroid deposit.', style: TextStyle(color: Color(0xFF5A7A9A)))),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // 3. Research Tab
  Widget _buildResearchTab(bool isDone) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Research Overview
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1520),
                  border: Border.all(color: const Color(0xFF00D4FF).withValues(alpha: 0.3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.science, color: Color(0xFF00D4FF), size: 28),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('APPLIED SCIENCE & R&D LAB', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                          const SizedBox(height: 2),
                          Text('Estimated output: +$_dailyRP RP / cycle based on assigned researchers & lab facilities.', style: const TextStyle(fontSize: 12, color: Color(0xFF5A7A9A))),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: isDone || _isResearching ? null : _handleResearch,
                      icon: _isResearching
                          ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Icon(Icons.bolt),
                      label: Text(isDone ? 'RESEARCH DONE' : 'CONDUCT RESEARCH'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D4FF),
                        foregroundColor: const Color(0xFF080C10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 10 Tech Trees
              ...ResearchService.techCatalog.entries.map((entry) {
                final key = entry.key;
                final meta = entry.value;
                final data = _researchList.where((r) => r.researchType == key).firstOrNull;
                final level = data?.level ?? 0;
                final progress = data?.progress ?? 0;
                final nextGoal = data?.nextGoal ?? 300;
                final isSelected = _selectedResearchType == key;

                return InkWell(
                  onTap: () async {
                    setState(() => _selectedResearchType = key);
                    final db = ref.read(databaseProvider);
                    final rp = await ResearchService(db).calculateDailyRP(ref.read(gameStateProvider).corpName, key);
                    setState(() => _dailyRP = rp);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF0F1E30) : const Color(0xFF0D1520),
                      border: Border.all(
                        color: isSelected ? const Color(0xFF00D4FF) : const Color(0xFF1A3050),
                        width: isSelected ? 2 : 1,
                      ),
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
                                Text(meta.icon, style: const TextStyle(fontSize: 18)),
                                const SizedBox(width: 8),
                                Text(meta.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF00D4FF).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text('LEVEL $level', style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            Text('$progress / $nextGoal RP', style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFFFFB740))),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(meta.description, style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (progress / (nextGoal > 0 ? nextGoal : 1)).clamp(0.0, 1.0),
                            backgroundColor: const Color(0xFF060A10),
                            color: const Color(0xFF00D4FF),
                            minHeight: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // 4. Facilities Tab
  Widget _buildFacilitiesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'STATION MODULES & INFRASTRUCTURE UPGRADES',
                style: TextStyle(fontFamily: 'monospace', fontSize: 12, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ..._buildings.map((b) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1520),
                    border: Border.all(color: const Color(0xFF1A3050)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xFF0F1E30),
                        radius: 20,
                        child: Icon(Icons.apartment, color: Color(0xFFFFB740), size: 20),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(b.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFB740).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text('LEVEL ${b.level}', style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Text(b.benefit, style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _isUpgrading ? null : () => _handleUpgradeBuilding(b.type),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFB740),
                          foregroundColor: const Color(0xFF080C10),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        ),
                        child: Text(
                          'UPGRADE (⁂${b.upgradeCost.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")})',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

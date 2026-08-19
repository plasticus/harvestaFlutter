import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../providers/turn_actions_provider.dart';
import '../game/missions/mission_generator_service.dart';
import '../game/missions/mission_runner_service.dart';
import '../game/missions/interruptor_engine.dart';
import 'combat_screen.dart';

class MissionCockpitScreen extends ConsumerStatefulWidget {
  final MissionContract contract;
  final String squadronName;

  const MissionCockpitScreen({
    super.key,
    required this.contract,
    required this.squadronName,
  });

  @override
  ConsumerState<MissionCockpitScreen> createState() => _MissionCockpitScreenState();
}

class _MissionCockpitScreenState extends ConsumerState<MissionCockpitScreen> {
  int _currentWaypoint = 1; // 1: Escape, 2: Transit, 3: Orbit, 4: Complete
  bool _isProcessing = false;
  final List<String> _flightLogs = [];

  MissionInterruptor? _activeInterruptor;
  SquadronSnapshot? _squadronSnapshot;
  InterruptorOutcome? _lastOutcome;
  MissionCompletionResult? _completionResult;

  @override
  void initState() {
    super.initState();
    _initMission();
  }

  Future<void> _initMission() async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final runner = MissionRunnerService(db);

    final snap = await runner.getSquadronSnapshot(gameState.corpName, widget.squadronName);
    setState(() {
      _squadronSnapshot = snap;
      _flightLogs.add('🚀 [T+00:00] ${widget.squadronName} cleared orbital dock. Main sublight engines firing for planetary escape.');
      _flightLogs.add('🎯 [DESTINATION] ${widget.contract.type} operation @ ${widget.contract.distance.toStringAsFixed(2)} AU.');
    });

    _checkWaypointEncounter();
  }

  void _checkWaypointEncounter() {
    if (_currentWaypoint >= 3) {
      _resolveFinalObjective();
      return;
    }

    final db = ref.read(databaseProvider);
    final runner = MissionRunnerService(db);
    final interruptor = runner.rollEncounter(step: _currentWaypoint, cr: widget.contract.cr);

    if (interruptor != null) {
      setState(() {
        _activeInterruptor = interruptor;
        _flightLogs.add('⚠️ [ALERT] Sector anomaly/threat detected along flight corridor! Waypoint transit halted.');
      });
    }
  }

  Future<void> _handleInterruptorChoice(String choiceKey) async {
    if (_activeInterruptor == null) return;
    setState(() => _isProcessing = true);

    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final runner = MissionRunnerService(db);

    try {
      final outcome = await runner.resolveEncounter(
        corpName: gameState.corpName,
        squadronName: widget.squadronName,
        interruptor: _activeInterruptor!,
        choiceKey: choiceKey,
        turn: gameState.gameTurn,
      );

      final updatedSnap = await runner.getSquadronSnapshot(gameState.corpName, widget.squadronName);

      setState(() {
        _lastOutcome = outcome;
        _squadronSnapshot = updatedSnap;
        _flightLogs.add('📡 [TACTICAL] ${outcome.narrative}');
        if (outcome.solarsGained > 0) {
          _flightLogs.add('💰 [REWARD] Gained ⁂${outcome.solarsGained} Solars from tactical resolution.');
        }
        if (outcome.rpGained > 0) {
          _flightLogs.add('🔬 [R&D] Transmitted +${outcome.rpGained} RP scientific telemetry.');
        }
        _isProcessing = false;
      });
    } catch (e) {
      setState(() => _isProcessing = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tactical error: $e')));
      }
    }
  }

  Future<void> _launchCombatArena() async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final runner = MissionRunnerService(db);

    final cr = _activeInterruptor?.cr ?? widget.contract.cr;

    final returned = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => CombatScreen(
          playerSquadronName: widget.squadronName,
          enemySquadronName: 'Corsair Raider Strike Group',
          enemyCorpName: 'Red Nebula Corsairs',
          threatIndex: cr,
          battleOrigin: 'Waypoint $_currentWaypoint Tactical Encounter',
        ),
      ),
    );

    if (returned == true && mounted) {
      final updatedSnap = await runner.getSquadronSnapshot(gameState.corpName, widget.squadronName);
      setState(() {
        _squadronSnapshot = updatedSnap;
        _flightLogs.add('⚔️ [COMBAT] Squadron resolved tactical engagement via Combat Arena.');
        _lastOutcome = const InterruptorOutcome(
          success: true,
          narrative: 'Enemy raider vessels neutralized in broadside combat arena. Derelict hull caches registered for salvage recovery.',
        );
      });
    }
  }

  void _resumeFlight() {
    setState(() {
      _activeInterruptor = null;
      _lastOutcome = null;
      _currentWaypoint++;
      if (_currentWaypoint == 2) {
        _flightLogs.add('✨ [T+01:45] Waypoint 1 passed. Entering deep space transit vector @ 0.42c.');
      } else if (_currentWaypoint == 3) {
        _flightLogs.add('🎯 [T+03:20] Waypoint 2 passed. Approaching target orbital insertion.');
      }
    });

    _checkWaypointEncounter();
  }

  Future<void> _resolveFinalObjective() async {
    setState(() => _isProcessing = true);
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final runner = MissionRunnerService(db);

    try {
      final res = await runner.completeMission(
        corpName: gameState.corpName,
        missionId: widget.contract.id,
        squadronName: widget.squadronName,
        turn: gameState.gameTurn,
      );

      await ref.read(gameStateProvider.notifier).refreshSolars();
      await ref.read(turnActionsProvider.notifier).markActionDone(gameState.corpName, gameState.gameTurn, 'expedition');

      setState(() {
        _currentWaypoint = 4; // Complete
        _completionResult = res;
        _isProcessing = false;
        _flightLogs.add('🏆 [MISSION SUCCESS] Objective achieved! All mission parameters satisfied.');
        _flightLogs.add('💰 [PAYOUT] Credited ⁂${res.payout} Solars to corporate treasury.');
        if (res.bonus != 'Solars' || res.bonusAmt > 0) {
          _flightLogs.add('🎁 [BONUS] Performance incentive received: ${res.bonusAmt} ${res.bonus}.');
        }
      });
    } catch (e) {
      setState(() => _isProcessing = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Completion error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EXPEDITION COCKPIT: ${widget.contract.type.toUpperCase()}'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E30),
              border: Border.all(color: const Color(0xFF00D4FF)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              widget.squadronName,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00D4FF),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Waypoint Flight HUD Header
          _buildWaypointHud(),

          // 2. Main Cockpit Area (Interactive Card or Live Feed)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_activeInterruptor != null) ...[
                    _buildInterruptorCard(),
                    const SizedBox(height: 16),
                  ] else if (_completionResult != null) ...[
                    _buildDebriefingCard(),
                    const SizedBox(height: 16),
                  ] else ...[
                    _buildCruisingCard(),
                    const SizedBox(height: 16),
                  ],

                  // Tactical Event Log Stream
                  _buildFlightLogFeed(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaypointHud() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: Color(0xFF090E17),
        border: Border(bottom: BorderSide(color: Color(0xFF1A3050))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWaypointStep(1, 'WP 1: Escape', _currentWaypoint >= 1),
              const Expanded(child: Divider(color: Color(0xFF1A3050), thickness: 2)),
              _buildWaypointStep(2, 'WP 2: Transit', _currentWaypoint >= 2),
              const Expanded(child: Divider(color: Color(0xFF1A3050), thickness: 2)),
              _buildWaypointStep(3, 'WP 3: Orbit', _currentWaypoint >= 3),
              const Expanded(child: Divider(color: Color(0xFF1A3050), thickness: 2)),
              _buildWaypointStep(4, 'Debrief', _currentWaypoint >= 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaypointStep(int step, String label, bool active) {
    final isDone = _currentWaypoint > step;
    final isCurrent = _currentWaypoint == step;

    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isDone
              ? const Color(0xFF39FF98)
              : (isCurrent ? const Color(0xFF00D4FF) : const Color(0xFF0D1520)),
          child: Text(
            isDone ? '✓' : '$step',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: (isDone || isCurrent) ? const Color(0xFF080C10) : const Color(0xFF5A7A9A),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'monospace',
            color: isCurrent ? const Color(0xFF00D4FF) : (isDone ? const Color(0xFF39FF98) : const Color(0xFF5A7A9A)),
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildCruisingCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1520),
        border: Border.all(color: const Color(0xFF00D4FF).withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Icon(Icons.rocket_launch, color: Color(0xFF00D4FF), size: 36),
          const SizedBox(height: 10),
          const Text(
            'CRUISING EN ROUTE TO TARGET',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 6),
          Text(
            'Sublight burn active. Flight telemetry running smoothly through waypoint $_currentWaypoint.',
            style: const TextStyle(fontSize: 12, color: Color(0xFF5A7A9A)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _isProcessing ? null : _resumeFlight,
            icon: const Icon(Icons.fast_forward, size: 16),
            label: Text('ADVANCE TO WAYPOINT ${_currentWaypoint + 1}'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00D4FF),
              foregroundColor: const Color(0xFF080C10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterruptorCard() {
    final snap = _squadronSnapshot;
    final interruptor = _activeInterruptor!;
    final choices = snap != null ? interruptor.getChoices(snap) : <InterruptorChoice>[];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF140D0D),
        border: Border.all(color: const Color(0xFFFF4D6A)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber, color: Color(0xFFFF4D6A), size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  interruptor.title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFFF4D6A)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(interruptor.description, style: const TextStyle(fontSize: 12, color: Color(0xFFC8DFF0))),
          const SizedBox(height: 16),

          if (_lastOutcome == null) ...[
            if (interruptor is PirateInterruptor) ...[
              ElevatedButton.icon(
                onPressed: _isProcessing ? null : _launchCombatArena,
                icon: const Icon(Icons.flash_on, size: 16),
                label: const Text('LAUNCH BROADSIDE COMBAT ARENA ⚔️', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D6A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Expanded(child: Divider(color: Color(0xFF1A3050))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR QUICK DIRECTIVE', style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFF5A7A9A))),
                  ),
                  Expanded(child: Divider(color: Color(0xFF1A3050))),
                ],
              ),
              const SizedBox(height: 14),
            ],
            const Text(
              'CHOOSE TACTICAL DIRECTIVE:',
              style: TextStyle(fontFamily: 'monospace', fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFFFB740)),
            ),
            const SizedBox(height: 10),
            ...choices.map((c) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF060A10),
                  border: Border.all(color: const Color(0xFF1A3050)),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(c.title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFF00D4FF).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                          child: Text(c.skillLabel, style: const TextStyle(fontSize: 10, color: Color(0xFF00D4FF), fontFamily: 'monospace')),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(c.description, style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: _isProcessing ? null : () => _handleInterruptorChoice(c.key),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFB740),
                          foregroundColor: const Color(0xFF080C10),
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        ),
                        child: const Text('EXECUTE DIRECTIVE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ] else ...[
            // Outcome Display
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF060A10),
                border: Border.all(color: _lastOutcome!.success ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(_lastOutcome!.success ? Icons.check_circle : Icons.error,
                          color: _lastOutcome!.success ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A), size: 18),
                      const SizedBox(width: 8),
                      Text(
                        _lastOutcome!.success ? 'DIRECTIVE SUCCESSFUL' : 'ENCOUNTER COMPLICATIONS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _lastOutcome!.success ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(_lastOutcome!.narrative, style: const TextStyle(fontSize: 12, color: Colors.white)),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: _resumeFlight,
                      icon: const Icon(Icons.arrow_forward, size: 14),
                      label: const Text('RESUME FLIGHT PATH'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D4FF),
                        foregroundColor: const Color(0xFF080C10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDebriefingCard() {
    final res = _completionResult!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1C14),
        border: Border.all(color: const Color(0xFF39FF98)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.military_tech, color: Color(0xFF39FF98), size: 28),
              SizedBox(width: 8),
              Text('MISSION DEBRIEFING & PAYOUT', style: TextStyle(fontFamily: 'monospace', fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF39FF98))),
            ],
          ),
          const SizedBox(height: 16),
          Text(res.narrative, style: const TextStyle(fontSize: 13, color: Colors.white)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF060A10),
              border: Border.all(color: const Color(0xFF1A3050)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Contract Payout:', style: TextStyle(color: Color(0xFF5A7A9A), fontSize: 12)),
                    Text('⁂ ${res.payout.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} Solars',
                        style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, color: Color(0xFFFFB740), fontSize: 13)),
                  ],
                ),
                if (res.bonus != 'Solars' || res.bonusAmt > 0) ...[
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Incentive Bonus:', style: TextStyle(color: Color(0xFF5A7A9A), fontSize: 12)),
                      Text('${res.bonusAmt} ${res.bonus}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF39FF98), fontSize: 12)),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (res.skillPromotions.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text('OFFICER FLIGHT COMMENDATIONS:', style: TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(res.skillPromotions.join(', '), style: const TextStyle(fontSize: 11, color: Color(0xFFC8DFF0))),
          ],
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF39FF98),
              foregroundColor: const Color(0xFF080C10),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('RETURN TO OPERATIONS DECK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightLogFeed() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF060A10),
        border: Border.all(color: const Color(0xFF1A3050)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.terminal, color: Color(0xFF00D4FF), size: 16),
              SizedBox(width: 6),
              Text('TACTICAL TELEMETRY STREAM', style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          ..._flightLogs.map((log) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                log,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFFC8DFF0)),
              ),
            );
          }),
        ],
      ),
    );
  }
}

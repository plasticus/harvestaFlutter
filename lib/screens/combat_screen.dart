import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../game/combat/combat_models.dart';
import '../game/combat/combat_engine.dart';
import '../game/combat/combat_service.dart';

class CombatScreen extends ConsumerStatefulWidget {
  final String playerSquadronName;
  final String enemySquadronName;
  final String enemyCorpName;
  final int threatIndex;
  final String battleOrigin;

  const CombatScreen({
    super.key,
    required this.playerSquadronName,
    required this.enemySquadronName,
    required this.enemyCorpName,
    this.threatIndex = 1,
    this.battleOrigin = 'Tactical Fleet Engagement',
  });

  @override
  ConsumerState<CombatScreen> createState() => _CombatScreenState();
}

class _CombatScreenState extends ConsumerState<CombatScreen> {
  bool _isLoading = true;
  late CombatEngine _engine;
  late CombatResult _combatResult;

  List<CombatParticipant> _displayTeamA = [];
  List<CombatParticipant> _displayTeamB = [];

  int _currentActionIndex = 0;
  final List<CombatActionLog> _allActions = [];
  bool _isPlaying = true;
  int _speedMultiplier = 1; // 1x, 2x, 4x
  Timer? _playbackTimer;

  CombatActionLog? _currentAction;
  String? _highlightedAttacker;
  String? _highlightedTarget;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _initBattle();
  }

  @override
  void dispose() {
    _playbackTimer?.cancel();
    super.dispose();
  }

  Future<void> _initBattle() async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final combatService = CombatService(db);

    final teamA = await combatService.buildParticipantsFromSquadron(
      gameState.corpName,
      widget.playerSquadronName,
    );

    final teamB = combatService.buildHostileEnemySquadron(
      enemyCorpName: widget.enemyCorpName,
      enemySquadronName: widget.enemySquadronName,
      threatIndex: widget.threatIndex,
    );

    _engine = CombatEngine(
      teamA: teamA,
      teamB: teamB,
      squadronA: widget.playerSquadronName,
      squadronB: widget.enemySquadronName,
      corpNameA: gameState.corpName,
      corpNameB: widget.enemyCorpName,
    );

    _combatResult = _engine.simulateFullBattle();

    // Flatten all action logs
    for (final round in _combatResult.roundLogs) {
      _allActions.addAll(round.actions);
    }

    // Deep copy initial states for step-by-step visual animation
    _displayTeamA = _copyParticipants(teamA);
    _displayTeamB = _copyParticipants(teamB);

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
      _startPlayback();
    }
  }

  List<CombatParticipant> _copyParticipants(List<CombatParticipant> list) {
    return list
        .map((p) => CombatParticipant(
              corpName: p.corpName,
              squadron: p.squadron,
              shipName: p.shipName,
              shipClass: p.shipClass,
              shipModel: p.shipModel,
              shipSize: p.shipSize,
              baseValue: p.baseValue,
              hp: p.hp,
              maxHp: p.maxHp,
              cargo: p.cargo,
              maxCargo: p.maxCargo,
              engines: p.engines,
              maxEngines: p.maxEngines,
              maneuv: p.maneuv,
              maxManeuv: p.maxManeuv,
              weapCtrl: p.weapCtrl,
              maxWeapCtrl: p.maxWeapCtrl,
              lifeSupp: p.lifeSupp,
              maxLifeSupp: p.maxLifeSupp,
              weapons: p.weapons,
              armor: p.armor,
              officers: p.officers,
              quirks: p.quirks,
            ))
        .toList();
  }

  void _startPlayback() {
    _playbackTimer?.cancel();
    if (!_isPlaying || _isFinished) return;

    final intervalMs = (1000 ~/ _speedMultiplier).clamp(150, 1000);
    _playbackTimer = Timer.periodic(Duration(milliseconds: intervalMs), (_) {
      _advanceAction();
    });
  }

  void _advanceAction() {
    if (_currentActionIndex >= _allActions.length) {
      _playbackTimer?.cancel();
      setState(() {
        _isFinished = true;
        _isPlaying = false;
        _highlightedAttacker = null;
        _highlightedTarget = null;
      });
      return;
    }

    final action = _allActions[_currentActionIndex];

    // Apply action damage to display participants
    if (action.isHit) {
      for (final ship in [..._displayTeamA, ..._displayTeamB]) {
        if (ship.shipName == action.targetShip) {
          ship.hp = (ship.hp - action.netDamage).clamp(0, ship.maxHp);

          if (action.criticalSubsystem != null && action.criticalSubsystemDamage > 0) {
            final dmg = action.criticalSubsystemDamage;
            switch (action.criticalSubsystem) {
              case 'Engines':
                ship.engines = (ship.engines - dmg).clamp(0, ship.maxEngines);
                break;
              case 'Maneuver':
                ship.maneuv = (ship.maneuv - dmg).clamp(0, ship.maxManeuv);
                break;
              case 'Weapon Control':
                ship.weapCtrl = (ship.weapCtrl - dmg).clamp(0, ship.maxWeapCtrl);
                break;
              case 'Life Support':
                ship.lifeSupp = (ship.lifeSupp - dmg).clamp(0, ship.maxLifeSupp);
                break;
              case 'Cargo':
                ship.cargo = (ship.cargo - dmg).clamp(0, ship.maxCargo);
                break;
            }
          }
        }
      }
    }

    setState(() {
      _currentAction = action;
      _highlightedAttacker = action.attackerShip;
      _highlightedTarget = action.targetShip;
      _currentActionIndex++;
    });
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
    if (_isPlaying) {
      _startPlayback();
    } else {
      _playbackTimer?.cancel();
    }
  }

  void _cycleSpeed() {
    setState(() {
      if (_speedMultiplier == 1) {
        _speedMultiplier = 2;
      } else if (_speedMultiplier == 2) {
        _speedMultiplier = 4;
      } else {
        _speedMultiplier = 1;
      }
    });
    if (_isPlaying) {
      _startPlayback();
    }
  }

  void _skipToEnd() {
    _playbackTimer?.cancel();
    // Fast-forward to final states
    while (_currentActionIndex < _allActions.length) {
      _advanceAction();
    }
    setState(() {
      _isFinished = true;
      _isPlaying = false;
      _highlightedAttacker = null;
      _highlightedTarget = null;
    });
  }

  Future<void> _claimAndExit() async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final combatService = CombatService(db);

    await combatService.commitCombatResults(
      playerCorp: gameState.corpName,
      result: _combatResult,
    );

    if (mounted) {
      Navigator.of(context).pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: Color(0xFF00D4FF)),
              SizedBox(height: 16),
              Text(
                'INITIALIZING TACTICAL BATTLE ARENA...',
                style: TextStyle(fontFamily: 'monospace', color: Color(0xFF00D4FF), fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.battleOrigin.toUpperCase()} // SQUADRON ENGAGEMENT'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E30),
              border: Border.all(color: const Color(0xFF00D4FF)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'ROUND ${_currentAction?.round ?? 1} / ${_combatResult.totalRounds}',
              style: const TextStyle(fontFamily: 'monospace', fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Top Squadron Arena Header
          _buildSquadronHeader(),

          // 2. Main Battle Grid (Friendly vs Enemy)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Friendly Ships (Left)
                Expanded(child: _buildSquadronSide(_displayTeamA, isFriendly: true)),
                // Vertical Laser Barrier
                Container(width: 2, color: const Color(0xFF1A3050)),
                // Enemy Ships (Right)
                Expanded(child: _buildSquadronSide(_displayTeamB, isFriendly: false)),
              ],
            ),
          ),

          // 3. Tactical Action Ticker & Narrative Banner
          _buildTacticalActionBanner(),

          // 4. Playback Controller Dock
          _buildPlaybackDock(),

          // 5. After-Action Report (when finished)
          if (_isFinished) _buildAfterActionReportCard(),
        ],
      ),
    );
  }

  Widget _buildSquadronHeader() {
    final teamAHull = _displayTeamA.fold<int>(0, (sum, s) => sum + s.hp);
    final teamAMax = _displayTeamA.fold<int>(0, (sum, s) => sum + s.maxHp);

    final teamBHull = _displayTeamB.fold<int>(0, (sum, s) => sum + s.hp);
    final teamBMax = _displayTeamB.fold<int>(0, (sum, s) => sum + s.maxHp);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF090E17),
        border: Border(bottom: BorderSide(color: Color(0xFF1A3050))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Friendly Squadron Status
          Row(
            children: [
              const CircleAvatar(radius: 5, backgroundColor: Color(0xFF00D4FF)),
              const SizedBox(width: 8),
              Text(widget.playerSquadronName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
              const SizedBox(width: 10),
              Text('HULL: $teamAHull / $teamAMax', style: const TextStyle(fontFamily: 'monospace', color: Color(0xFF00D4FF), fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          ),
          const Text('⚔️ VS ⚔️', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFB740), fontSize: 12)),
          // Enemy Squadron Status
          Row(
            children: [
              Text('HULL: $teamBHull / $teamBMax', style: const TextStyle(fontFamily: 'monospace', color: Color(0xFFFF4D6A), fontSize: 11, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text(widget.enemySquadronName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
              const SizedBox(width: 8),
              const CircleAvatar(radius: 5, backgroundColor: Color(0xFFFF4D6A)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSquadronSide(List<CombatParticipant> ships, {required bool isFriendly}) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: ships.length,
      itemBuilder: (ctx, idx) {
        final ship = ships[idx];
        final isAttacking = _highlightedAttacker == ship.shipName;
        final isTargeted = _highlightedTarget == ship.shipName;

        return _buildVesselCombatCard(ship, isFriendly: isFriendly, isAttacking: isAttacking, isTargeted: isTargeted);
      },
    );
  }

  Widget _buildVesselCombatCard(
    CombatParticipant ship, {
    required bool isFriendly,
    required bool isAttacking,
    required bool isTargeted,
  }) {
    final hpPct = ship.maxHp > 0 ? (ship.hp / ship.maxHp).clamp(0.0, 1.0) : 0.0;
    final isDestroyed = ship.isDestroyed;

    Color borderColor = const Color(0xFF1A3050);
    if (isAttacking) borderColor = isFriendly ? const Color(0xFF00D4FF) : const Color(0xFFFFB740);
    if (isTargeted) borderColor = const Color(0xFFFF4D6A);

    Widget card = Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDestroyed ? const Color(0xFF1A0A0A) : const Color(0xFF0D1520),
        border: Border.all(color: borderColor, width: (isAttacking || isTargeted) ? 2 : 1),
        borderRadius: BorderRadius.circular(8),
        boxShadow: isAttacking
            ? [BoxShadow(color: (isFriendly ? const Color(0xFF00D4FF) : const Color(0xFFFFB740)).withValues(alpha: 0.4), blurRadius: 10)]
            : (isTargeted ? [const BoxShadow(color: Color(0xFFFF4D6A), blurRadius: 12)] : []),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Name, IFF pill, Class
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isDestroyed ? const Color(0xFF5A7A9A) : (isFriendly ? const Color(0xFF00D4FF) : const Color(0xFFFF4D6A)),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        ship.shipName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: isDestroyed ? const Color(0xFF5A7A9A) : Colors.white,
                          decoration: isDestroyed ? TextDecoration.lineThrough : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${ship.shipClass} (${ship.shipModel})',
                style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFF5A7A9A)),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Hull HP Bar
          Row(
            children: [
              const Text('HULL', style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFF5A7A9A))),
              const SizedBox(width: 8),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: hpPct,
                    minHeight: 6,
                    backgroundColor: const Color(0xFF060A10),
                    valueColor: AlwaysStoppedAnimation(
                      hpPct > 0.5 ? const Color(0xFF39FF98) : (hpPct > 0.2 ? const Color(0xFFFFB740) : const Color(0xFFFF4D6A)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${ship.hp}/${ship.maxHp}',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  color: isDestroyed ? const Color(0xFFFF4D6A) : Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 5 Secondary Subsystem Health Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSubDot('Eng', ship.engines, ship.maxEngines),
              _buildSubDot('Mnv', ship.maneuv, ship.maxManeuv),
              _buildSubDot('Wpn', ship.weapCtrl, ship.maxWeapCtrl),
              _buildSubDot('Crg', ship.cargo, ship.maxCargo),
              _buildSubDot('Lif', ship.lifeSupp, ship.maxLifeSupp),
            ],
          ),
        ],
      ),
    );

    if (isTargeted) {
      card = card.animate().shake(duration: 250.ms);
    } else if (isAttacking) {
      card = card.animate().scale(begin: const Offset(0.98, 0.98), end: const Offset(1.02, 1.02), duration: 200.ms);
    }

    return card;
  }

  Widget _buildSubDot(String label, int cur, int max) {
    final pct = max > 0 ? (cur / max) : 1.0;
    Color color = const Color(0xFF39FF98);
    if (pct <= 0) {
      color = const Color(0xFFFF4D6A);
    } else if (pct < 0.5) {
      color = const Color(0xFFFFB740);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(fontSize: 9, color: Color(0xFF5A7A9A))),
        const SizedBox(width: 3),
        Text('$cur', style: TextStyle(fontSize: 9, fontFamily: 'monospace', fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }

  Widget _buildTacticalActionBanner() {
    final act = _currentAction;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF090E17),
        border: const Border(top: BorderSide(color: Color(0xFF1A3050))),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.flash_on, color: Color(0xFFFFB740), size: 16),
              const SizedBox(width: 6),
              Text(
                act != null ? 'TACTICAL FIRING LOG [EVENT #$_currentActionIndex]' : 'AWAITING FIRING INITIATIVE...',
                style: const TextStyle(fontFamily: 'monospace', fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFFFFB740)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            act?.narrative ?? 'Weapon batteries powered and targeting arrays locked.',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: act != null && act.isHit ? (act.targetDestroyed ? const Color(0xFFFF4D6A) : const Color(0xFF00D4FF)) : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaybackDock() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF060A10),
        border: Border(top: BorderSide(color: Color(0xFF1A3050))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow, color: const Color(0xFF00D4FF)),
                onPressed: _isFinished ? null : _togglePlayPause,
                tooltip: _isPlaying ? 'Pause' : 'Play',
              ),
              IconButton(
                icon: const Icon(Icons.skip_next, color: Color(0xFFC8DFF0)),
                onPressed: _isFinished ? null : _advanceAction,
                tooltip: 'Step 1 Action',
              ),
              OutlinedButton(
                onPressed: _cycleSpeed,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  side: const BorderSide(color: Color(0xFF1A3050)),
                ),
                child: Text('${_speedMultiplier}x', style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: _isFinished ? null : _skipToEnd,
            icon: const Icon(Icons.fast_forward, size: 14),
            label: const Text('SKIP TO END', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F1E30),
              foregroundColor: const Color(0xFF00D4FF),
              side: const BorderSide(color: Color(0xFF00D4FF)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAfterActionReportCard() {
    final res = _combatResult;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: res.isVictory ? const Color(0xFF0D1C14) : const Color(0xFF1C0D0D),
        border: Border.all(color: res.isVictory ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(res.isVictory ? Icons.emoji_events : Icons.dangerous, color: res.isVictory ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A), size: 24),
              const SizedBox(width: 8),
              Text(
                res.isVictory ? 'VICTORY: ENEMY SQUADRON ROUTED' : 'DEFEAT: SQUADRON NEUTRALIZED',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: res.isVictory ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (res.salvageWreckages.isNotEmpty) ...[
            Text('📦 ${res.salvageWreckages.length} Derelict Wreckage Caches Registered for Salvage Operations.',
                style: const TextStyle(fontSize: 11, color: Color(0xFFC8DFF0))),
            const SizedBox(height: 6),
          ],
          ElevatedButton(
            onPressed: _claimAndExit,
            style: ElevatedButton.styleFrom(
              backgroundColor: res.isVictory ? const Color(0xFF39FF98) : const Color(0xFFFF4D6A),
              foregroundColor: const Color(0xFF080C10),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('COMMIT AFTER-ACTION REPORT & RETURN', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

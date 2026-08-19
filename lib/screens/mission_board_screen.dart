import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../providers/turn_actions_provider.dart';
import '../game/missions/mission_generator_service.dart';
import '../game/missions/mission_runner_service.dart';
import 'mission_cockpit_screen.dart';

class MissionBoardScreen extends ConsumerStatefulWidget {
  const MissionBoardScreen({super.key});

  @override
  ConsumerState<MissionBoardScreen> createState() => _MissionBoardScreenState();
}

class _MissionBoardScreenState extends ConsumerState<MissionBoardScreen> {
  bool _isLoading = true;
  List<MissionContract> _missions = [];
  bool _isLaunching = false;

  @override
  void initState() {
    super.initState();
    _loadMissions();
  }

  Future<void> _loadMissions() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    final db = ref.read(databaseProvider);
    final service = MissionGeneratorService(db);
    final contracts = await service.generateMissions(gameState.corpName, gameState.gameTurn);

    if (mounted) {
      setState(() {
        _missions = contracts;
        _isLoading = false;
      });
    }
  }

  Future<void> _promptSquadronSelection(MissionContract contract) async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);

    final ships = await db.fleetDao.getCorpShips(gameState.corpName);
    final squadrons = ships.map((s) => s.squadron).toSet().toList();
    if (squadrons.isEmpty) squadrons.add('Alpha Squadron');

    if (!mounted) return;

    String selectedSquadron = squadrons.first;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) {
          return AlertDialog(
            backgroundColor: const Color(0xFF0D1520),
            title: Text('LAUNCH EXPEDITION: ${contract.type.toUpperCase()}',
                style: const TextStyle(color: Color(0xFF00D4FF), fontSize: 16)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Distance: ${contract.distance.toStringAsFixed(2)} AU | Threat: CR-${contract.cr}',
                  style: const TextStyle(color: Color(0xFFC8DFF0), fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  'Estimated Fuel Cost: ⁂${contract.fuelCost.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} Solars',
                  style: const TextStyle(color: Color(0xFFFFB740), fontWeight: FontWeight.bold, fontSize: 12),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: selectedSquadron,
                  decoration: const InputDecoration(
                    labelText: 'Select Deployed Squadron',
                    filled: true,
                    fillColor: Color(0xFF060A10),
                  ),
                  items: squadrons.map((sq) {
                    final count = ships.where((s) => s.squadron == sq).length;
                    return DropdownMenuItem(value: sq, child: Text('$sq ($count vessels)'));
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) setDialogState(() => selectedSquadron = val);
                  },
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('CANCEL')),
              ElevatedButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D4FF), foregroundColor: const Color(0xFF080C10)),
                child: const Text('AUTHORIZE LAUNCH', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          );
        },
      ),
    );

    if (confirmed == true && mounted) {
      setState(() => _isLaunching = true);
      try {
        final runner = MissionRunnerService(db);
        await runner.startMission(
          corpName: gameState.corpName,
          missionId: contract.id,
          squadronName: selectedSquadron,
          turn: gameState.gameTurn,
        );

        await ref.read(gameStateProvider.notifier).refreshSolars();

        if (mounted) {
          final completed = await Navigator.of(context).push<bool>(
            MaterialPageRoute(
              builder: (_) => MissionCockpitScreen(
                contract: contract,
                squadronName: selectedSquadron,
              ),
            ),
          );

          if (completed == true) {
            await _loadMissions();
          }
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$e'), backgroundColor: const Color(0xFFFF4D6A)),
          );
        }
      } finally {
        if (mounted) {
          setState(() => _isLaunching = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);
    final actions = ref.watch(turnActionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DEEP SPACE EXPEDITION BOARD'),
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
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Header banner
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1520),
                    border: Border.all(color: const Color(0xFF1A3050)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.travel_explore, color: Color(0xFF00D4FF), size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('SOLAR SYSTEM MISSION CONTRACTS',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                            const SizedBox(height: 2),
                            Text(
                              actions.expeditionDone
                                  ? 'Turn expedition quota satisfied. Additional missions available for extra profit.'
                                  : 'Dispatch a squadron across 3 waypoint sectors to fulfill client contracts and gain Solars & XP.',
                              style: TextStyle(
                                fontSize: 11,
                                color: actions.expeditionDone ? const Color(0xFF39FF98) : const Color(0xFF5A7A9A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                if (_missions.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text('No active mission contracts available this cycle.', style: TextStyle(color: Color(0xFF5A7A9A))),
                    ),
                  )
                else
                  ..._missions.map((m) => _buildMissionCard(m)),
              ],
            ),
    );
  }

  Widget _buildMissionCard(MissionContract m) {
    Color typeColor;
    switch (m.type) {
      case 'Attack':
      case 'Bounty':
        typeColor = const Color(0xFFF87171);
        break;
      case 'Salvage':
      case 'Mine':
        typeColor = const Color(0xFFFBBF24);
        break;
      case 'Research':
        typeColor = const Color(0xFF38BDF8);
        break;
      case 'Espionage':
        typeColor = const Color(0xFFC084FC);
        break;
      default:
        typeColor = const Color(0xFF34D399);
    }

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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: typeColor.withValues(alpha: 0.15),
                      border: Border.all(color: typeColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      m.type.toUpperCase(),
                      style: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 11, color: typeColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF060A10),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Threat CR-${m.cr}',
                      style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: Color(0xFFC8DFF0)),
                    ),
                  ),
                ],
              ),
              Text(
                '⁂ ${m.payout.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} Solars',
                style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFFFB740)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(m.narrative, style: const TextStyle(fontSize: 12, color: Color(0xFFC8DFF0))),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.straighten, size: 14, color: Color(0xFF5A7A9A)),
                  const SizedBox(width: 4),
                  Text('${m.distance.toStringAsFixed(2)} AU', style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A), fontFamily: 'monospace')),
                  const SizedBox(width: 14),
                  const Icon(Icons.local_gas_station, size: 14, color: Color(0xFF5A7A9A)),
                  const SizedBox(width: 4),
                  Text('Fuel: ⁂${m.fuelCost}', style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A), fontFamily: 'monospace')),
                  if (m.bonus != 'Solars' || m.bonusAmt > 0) ...[
                    const SizedBox(width: 14),
                    const Icon(Icons.card_giftcard, size: 14, color: Color(0xFF39FF98)),
                    const SizedBox(width: 4),
                    Text('+${m.bonusAmt} ${m.bonus}', style: const TextStyle(fontSize: 11, color: Color(0xFF39FF98), fontWeight: FontWeight.bold)),
                  ],
                ],
              ),
              ElevatedButton.icon(
                onPressed: _isLaunching ? null : () => _promptSquadronSelection(m),
                icon: const Icon(Icons.rocket_launch, size: 14),
                label: const Text('DISPATCH SQUADRON', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  foregroundColor: const Color(0xFF080C10),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

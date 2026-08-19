import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import '../providers/game_state_provider.dart';
import '../game/fleet/ship_service.dart';
import '../game/fleet/ship_mod_service.dart';
import '../game/fleet/crew_service.dart';
import '../data/app_database.dart';

class FleetScreen extends ConsumerStatefulWidget {
  final int initialTabIndex;
  const FleetScreen({super.key, this.initialTabIndex = 0});

  @override
  ConsumerState<FleetScreen> createState() => _FleetScreenState();
}

class _FleetScreenState extends ConsumerState<FleetScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;

  List<FleetShip> _fleet = [];
  List<ShipModelEntry> _shipModels = [];
  List<CrewMember> _officers = [];
  List<ShipMod> _allInstalledMods = [];
  List<ShipModAvailable> _availableMods = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTabIndex);
    _loadFleetData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadFleetData() async {
    final gameState = ref.read(gameStateProvider);
    if (gameState.corpName.isEmpty) return;

    final db = ref.read(databaseProvider);
    final fleet = await db.fleetDao.getCorpShips(gameState.corpName);
    final models = await (db.select(db.shipModels)).get();
    final officers = await db.crewDao.getCorpCrew(gameState.corpName);

    final shipNames = fleet.map((s) => s.shipName).toSet();
    final mods = await (db.select(db.shipMods)..where((m) => m.shipName.isIn(shipNames))).get();
    final availMods = await (db.select(db.shipModsAvailable)).get();

    if (mounted) {
      setState(() {
        _fleet = fleet;
        _shipModels = models;
        _officers = officers;
        _allInstalledMods = mods;
        _availableMods = availMods;
        _isLoading = false;
      });
    }
  }

  // --- ACTIONS ---

  Future<void> _openDrydockDialog(FleetShip ship) async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final shipService = ShipService(db);
    final est = await shipService.getRepairEstimate(gameState.corpName, ship.shipName);

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0D1520),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DRYDOCK FACILITY: ${ship.shipName}',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF00D4FF)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Color(0xFF5A7A9A)),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (!est.needsRepair) ...[
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          '✅ Structural Integrity 100%. Vessel is fully operational.',
                          style: TextStyle(color: Color(0xFF39FF98), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ] else ...[
                    Text(
                      'Damage Level: ${(est.damageFraction * 100).round()}% | Discount: ${(est.discount * 100).round()}% (Shipbuilding Tech)',
                      style: const TextStyle(fontSize: 12, color: Color(0xFFC8DFF0)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        // Contract Option
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFF060A10),
                              border: Border.all(color: const Color(0xFF1A3050)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('CONTRACT REPAIR', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                                const SizedBox(height: 6),
                                const Text('Outsourced yard service. Solars only.', style: TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                                const SizedBox(height: 10),
                                Text('⁂ ${est.contractCost.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                                    style: const TextStyle(fontFamily: 'monospace', fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFFFB740))),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await shipService.repairShip(
                                        corpName: gameState.corpName,
                                        shipName: ship.shipName,
                                        inHouse: false,
                                        turn: gameState.gameTurn,
                                      );
                                      await ref.read(gameStateProvider.notifier).refreshSolars();
                                      await _loadFleetData();
                                      if (ctx.mounted) Navigator.of(ctx).pop();
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${ship.shipName} repaired via Contract!'), backgroundColor: const Color(0xFF39FF98)),
                                        );
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('$e'), backgroundColor: const Color(0xFFFF4D6A)),
                                        );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFB740), foregroundColor: const Color(0xFF080C10)),
                                  child: const Text('AUTHORIZE CONTRACT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        // In-House Option
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFF060A10),
                              border: Border.all(color: const Color(0xFF1A3050)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('IN-HOUSE DRYDOCK', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
                                const SizedBox(height: 6),
                                Text(
                                  '⁂${est.inHouseCost} + ${est.zeroGMetals}m³ Zero-G, ${est.conductiveMetals}m³ Cond, ${est.lifeSupportGases}m³ Gas',
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A)),
                                ),
                                const SizedBox(height: 10),
                                Text('⁂ ${est.inHouseCost.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                                    style: const TextStyle(fontFamily: 'monospace', fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF39FF98))),
                                const SizedBox(height: 12),
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await shipService.repairShip(
                                        corpName: gameState.corpName,
                                        shipName: ship.shipName,
                                        inHouse: true,
                                        turn: gameState.gameTurn,
                                      );
                                      await ref.read(gameStateProvider.notifier).refreshSolars();
                                      await _loadFleetData();
                                      if (ctx.mounted) Navigator.of(ctx).pop();
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('${ship.shipName} repaired In-House!'), backgroundColor: const Color(0xFF39FF98)),
                                        );
                                      }
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('$e'), backgroundColor: const Color(0xFFFF4D6A)),
                                        );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF39FF98), foregroundColor: const Color(0xFF080C10)),
                                  child: const Text('DISPATCH DRYDOCK', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _openModulesDialog(FleetShip ship) async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final modService = ShipModService(db);
    final hp = await modService.getShipHardpoints(gameState.corpName, ship.shipName);

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0D1520),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                height: MediaQuery.of(ctx).size.height * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('HARDPOINT MODS: ${ship.shipName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF00D4FF))),
                        IconButton(icon: const Icon(Icons.close, color: Color(0xFF5A7A9A)), onPressed: () => Navigator.of(ctx).pop()),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Hardpoint slot meters
                    Row(
                      children: [
                        _buildHardpointGauge('Weapon Slots', hp.weapUsed, hp.weapMax, const Color(0xFFF87171)),
                        const SizedBox(width: 10),
                        _buildHardpointGauge('Armor Slots', hp.armorUsed, hp.armorMax, const Color(0xFF38BDF8)),
                        const SizedBox(width: 10),
                        _buildHardpointGauge('Bay Slots', hp.bayUsed, hp.bayMax, const Color(0xFF34D399)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text('INSTALLED MODULES', style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF00D4FF), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    if (hp.installedMods.isEmpty)
                      const Text('No upgrade modules installed.', style: TextStyle(fontSize: 12, color: Color(0xFF5A7A9A)))
                    else
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: hp.installedMods.map((m) {
                          return Chip(
                            backgroundColor: const Color(0xFF060A10),
                            side: const BorderSide(color: Color(0xFF1A3050)),
                            label: Text('${m.modName ?? "Module"} (+${m.power} pwr)'),
                            labelStyle: const TextStyle(fontSize: 11, color: Colors.white),
                            deleteIcon: const Icon(Icons.close, size: 14, color: Color(0xFFFF4D6A)),
                            onDeleted: () async {
                              try {
                                await modService.uninstallModule(
                                  corpName: gameState.corpName,
                                  shipName: ship.shipName,
                                  modId: m.modId,
                                  turn: gameState.gameTurn,
                                );
                                await ref.read(gameStateProvider.notifier).refreshSolars();
                                await _loadFleetData();
                                if (ctx.mounted) Navigator.of(ctx).pop();
                              } catch (e) {
                                if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
                              }
                            },
                          );
                        }).toList(),
                      ),
                    const SizedBox(height: 20),
                    const Text('PURCHASE & FIT NEW MODULES', style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _availableMods.length,
                        itemBuilder: (ctx, idx) {
                          final mod = _availableMods[idx];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF060A10),
                              border: Border.all(color: const Color(0xFF1A3050)),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(mod.modName, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
                                      Text('${mod.modType} | Power: +${mod.power}', style: const TextStyle(fontSize: 10, color: Color(0xFF5A7A9A))),
                                    ],
                                  ),
                                ),
                                Text('⁂ ${mod.price.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                                    style: const TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () async {
                                    try {
                                      await modService.installModule(
                                        corpName: gameState.corpName,
                                        shipName: ship.shipName,
                                        modName: mod.modName,
                                        turn: gameState.gameTurn,
                                      );
                                      await ref.read(gameStateProvider.notifier).refreshSolars();
                                      await _loadFleetData();
                                      if (ctx.mounted) Navigator.of(ctx).pop();
                                    } catch (e) {
                                      if (mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('$e'), backgroundColor: const Color(0xFFFF4D6A)),
                                        );
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF00D4FF),
                                    foregroundColor: const Color(0xFF080C10),
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  ),
                                  child: const Text('FIT', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHardpointGauge(String label, int used, int max, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF060A10),
          border: Border.all(color: const Color(0xFF1A3050)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF5A7A9A))),
            const SizedBox(height: 2),
            Text('$used / $max', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color, fontFamily: 'monospace')),
          ],
        ),
      ),
    );
  }

  Future<void> _openBridgeCrewDialog(FleetShip ship) async {
    final gameState = ref.read(gameStateProvider);
    final db = ref.read(databaseProvider);
    final crewService = CrewService(db);

    final shipOfficers = _officers.where((o) => o.shipName == ship.shipName).toList();
    int? captainId = shipOfficers.where((o) => o.assignment == 'Captain').firstOrNull?.id;
    int? pilotId = shipOfficers.where((o) => o.assignment == 'Pilot').firstOrNull?.id;
    int? foId = shipOfficers.where((o) => o.assignment == 'First Officer').firstOrNull?.id;
    int? soId = shipOfficers.where((o) => o.assignment == 'Second Officer').firstOrNull?.id;

    final availableOfficers = _officers.where((o) => o.assignment != 'Research').toList();

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0D1520),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BRIDGE CREW: ${ship.shipName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF00D4FF))),
                      IconButton(icon: const Icon(Icons.close, color: Color(0xFF5A7A9A)), onPressed: () => Navigator.of(ctx).pop()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildOfficerDropdown('Captain (Command & Leadership)', captainId, availableOfficers, (val) => setModalState(() => captainId = val)),
                  const SizedBox(height: 10),
                  _buildOfficerDropdown('Helm Pilot (Astrogation & Maneuver)', pilotId, availableOfficers, (val) => setModalState(() => pilotId = val)),
                  const SizedBox(height: 10),
                  _buildOfficerDropdown('First Officer (Gunnery & Weapons)', foId, availableOfficers, (val) => setModalState(() => foId = val)),
                  const SizedBox(height: 10),
                  _buildOfficerDropdown('Second Officer (Engineering & Repair)', soId, availableOfficers, (val) => setModalState(() => soId = val)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await crewService.assignBridgeCrew(
                        corpName: gameState.corpName,
                        shipName: ship.shipName,
                        captainId: captainId,
                        pilotId: pilotId,
                        firstOfficerId: foId,
                        secondOfficerId: soId,
                      );
                      await _loadFleetData();
                      if (ctx.mounted) Navigator.of(ctx).pop();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D4FF), foregroundColor: const Color(0xFF080C10)),
                    child: const Text('SAVE BRIDGE ASSIGNMENTS', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildOfficerDropdown(String label, int? selectedId, List<CrewMember> options, ValueChanged<int?> onChanged) {
    return DropdownButtonFormField<int?>(
      initialValue: selectedId,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: const Color(0xFF060A10),
        border: const OutlineInputBorder(),
      ),
      items: [
        const DropdownMenuItem<int?>(value: null, child: Text('None / Unassigned')),
        ...options.map((o) {
          return DropdownMenuItem<int?>(
            value: o.id,
            child: Text('${o.name} (Ldr:${o.leadership} Plt:${o.pilot} Wpn:${o.shipWeapons})'),
          );
        }),
      ],
      onChanged: onChanged,
    );
  }

  Future<void> _handleDecommission(FleetShip ship) async {
    final gameState = ref.read(gameStateProvider);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D1520),
        title: Text('Decommission ${ship.shipName}?'),
        content: Text('Are you sure you want to decommission this vessel for scrap value (⁂${ship.value})? This cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF4D6A)),
            child: const Text('DECOMMISSION'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final db = ref.read(databaseProvider);
      final shipService = ShipService(db);
      final scrapVal = await shipService.sellShip(
        corpName: gameState.corpName,
        shipName: ship.shipName,
        turn: gameState.gameTurn,
      );
      await ref.read(gameStateProvider.notifier).refreshSolars();
      await _loadFleetData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${ship.shipName} decommissioned for ⁂$scrapVal Solars!'), backgroundColor: const Color(0xFFFFB740)),
        );
      }
    }
  }

  Future<void> _openPurchaseShipDialog(ShipModelEntry model) async {
    final gameState = ref.read(gameStateProvider);
    final nameController = TextEditingController(text: '${model.model} ${DateTime.now().millisecond}');
    String selectedSquadron = 'Alpha Squadron';

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF0D1520),
        title: Text('COMMISSION ${model.model}', style: const TextStyle(color: Color(0xFF00D4FF))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Vessel Registry Name', filled: true, fillColor: Color(0xFF060A10)),
            ),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              initialValue: selectedSquadron,
              decoration: const InputDecoration(labelText: 'Assigned Squadron', filled: true, fillColor: Color(0xFF060A10)),
              items: const [
                DropdownMenuItem(value: 'Alpha Squadron', child: Text('Alpha Squadron')),
                DropdownMenuItem(value: 'Beta Squadron', child: Text('Beta Squadron')),
                DropdownMenuItem(value: 'Gamma Squadron', child: Text('Gamma Squadron')),
              ],
              onChanged: (val) => selectedSquadron = val ?? 'Alpha Squadron',
            ),
            const SizedBox(height: 14),
            Text('Price: ⁂${model.baseValue.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")} Solars',
                style: const TextStyle(color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('CANCEL')),
          ElevatedButton(
            onPressed: () async {
              try {
                final db = ref.read(databaseProvider);
                final shipService = ShipService(db);
                await shipService.purchaseShip(
                  corpName: gameState.corpName,
                  modelName: model.model,
                  shipName: nameController.text,
                  squadron: selectedSquadron,
                  turn: gameState.gameTurn,
                );
                await ref.read(gameStateProvider.notifier).refreshSolars();
                await _loadFleetData();
                if (ctx.mounted) Navigator.of(ctx).pop();
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${nameController.text} commissioned successfully!'), backgroundColor: const Color(0xFF39FF98)),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$e'), backgroundColor: const Color(0xFFFF4D6A)),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00D4FF), foregroundColor: const Color(0xFF080C10)),
            child: const Text('AUTHORIZE PURCHASE'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FLEET COMMAND & ORBITAL SHIPYARD'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00D4FF),
          labelColor: const Color(0xFF00D4FF),
          unselectedLabelColor: const Color(0xFF5A7A9A),
          tabs: const [
            Tab(icon: Icon(Icons.rocket_launch), text: 'Alpha Squadron'),
            Tab(icon: Icon(Icons.view_agenda), text: 'All Vessels'),
            Tab(icon: Icon(Icons.storefront), text: 'Shipyard Catalog'),
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
                _buildSquadronView('Alpha Squadron'),
                _buildSquadronView(null),
                _buildShipyardCatalogView(),
              ],
            ),
    );
  }

  Widget _buildSquadronView(String? squadronFilter) {
    final vessels = squadronFilter != null ? _fleet.where((s) => s.squadron == squadronFilter).toList() : _fleet;

    if (vessels.isEmpty) {
      return Center(
        child: Text(
          squadronFilter != null ? 'No vessels assigned to $squadronFilter.' : 'No vessels in corporate fleet.',
          style: const TextStyle(color: Color(0xFF5A7A9A)),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: vessels.length,
      itemBuilder: (ctx, idx) {
        final ship = vessels[idx];
        final shipMods = _allInstalledMods.where((m) => m.shipName == ship.shipName).toList();
        final shipCrew = _officers.where((o) => o.shipName == ship.shipName).toList();

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1520),
            border: Border.all(color: const Color(0xFF1A3050)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title & Value Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('🚀', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 8),
                      Text(ship.shipName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: const Color(0xFF00D4FF).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                        child: Text('${ship.shipModel} (${ship.shipClass})', style: const TextStyle(fontSize: 10, color: Color(0xFF00D4FF), fontFamily: 'monospace')),
                      ),
                    ],
                  ),
                  Text('⁂ ${ship.value.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                      style: const TextStyle(fontFamily: 'monospace', fontSize: 13, color: Color(0xFFFFB740), fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 12),

              // 6 Subsystem Health Gauges
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  _buildSubsystemBadge('Hull HP', ship.hp, ship.maxHp, const Color(0xFF39FF98)),
                  _buildSubsystemBadge('Cargo', ship.cargo, ship.maxCargo, const Color(0xFF38BDF8)),
                  _buildSubsystemBadge('Engines', ship.engines, ship.maxEngines, const Color(0xFFFBBF24)),
                  _buildSubsystemBadge('Maneuver', ship.maneuv, ship.maxManeuv, const Color(0xFFC084FC)),
                  _buildSubsystemBadge('WeapCtrl', ship.weapCtrl, ship.maxWeapCtrl, const Color(0xFFF87171)),
                  _buildSubsystemBadge('LifeSupp', ship.lifeSupp, ship.maxLifeSupp, const Color(0xFF67E8F9)),
                ],
              ),
              const SizedBox(height: 12),

              // Fitted Modules & Crew row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('INSTALLED MODULES', style: TextStyle(fontSize: 10, color: Color(0xFF5A7A9A), fontFamily: 'monospace')),
                        const SizedBox(height: 4),
                        if (shipMods.isEmpty)
                          const Text('Stock configuration (no mods)', style: TextStyle(fontSize: 11, color: Color(0xFF5A7A9A), fontStyle: FontStyle.italic))
                        else
                          Text(shipMods.map((m) => m.modName ?? "Mod").join(', '), style: const TextStyle(fontSize: 11, color: Color(0xFFC8DFF0))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('BRIDGE OFFICERS', style: TextStyle(fontSize: 10, color: Color(0xFF5A7A9A), fontFamily: 'monospace')),
                        const SizedBox(height: 4),
                        if (shipCrew.isEmpty)
                          const Text('Unassigned (automated)', style: TextStyle(fontSize: 11, color: Color(0xFF5A7A9A), fontStyle: FontStyle.italic))
                        else
                          Text(shipCrew.map((c) => '${c.assignment}: ${c.name}').join(' | '), style: const TextStyle(fontSize: 11, color: Color(0xFFC8DFF0))),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _openDrydockDialog(ship),
                    icon: const Icon(Icons.build, size: 14),
                    label: const Text('DRYDOCK', style: TextStyle(fontSize: 11)),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () => _openModulesDialog(ship),
                    icon: const Icon(Icons.extension, size: 14),
                    label: const Text('MODULES', style: TextStyle(fontSize: 11)),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton.icon(
                    onPressed: () => _openBridgeCrewDialog(ship),
                    icon: const Icon(Icons.people, size: 14),
                    label: const Text('BRIDGE STAFF', style: TextStyle(fontSize: 11)),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFFF4D6A)),
                    onPressed: () => _handleDecommission(ship),
                    tooltip: 'Decommission Vessel',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSubsystemBadge(String name, int cur, int max, Color color) {
    final pct = max > 0 ? (cur / max).clamp(0.0, 1.0) : 1.0;
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
          Text(name, style: const TextStyle(fontSize: 10, color: Color(0xFF5A7A9A))),
          const SizedBox(width: 6),
          Text('$cur/$max', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: pct < 1.0 ? const Color(0xFFFF4D6A) : color, fontFamily: 'monospace')),
        ],
      ),
    );
  }

  Widget _buildShipyardCatalogView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _shipModels.length,
      itemBuilder: (ctx, idx) {
        final model = _shipModels[idx];
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
                radius: 22,
                child: Icon(Icons.rocket, color: Color(0xFF00D4FF)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(model.model, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: const Color(0xFF00D4FF).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                          child: Text('${model.shipClass} (Size ${model.size})', style: const TextStyle(fontSize: 10, color: Color(0xFF00D4FF), fontFamily: 'monospace')),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('Cargo: ${model.cargo}m³ | HP: ${model.hp} | Armor: ${model.armor} | Bays: ${model.bays} | Weap: ${model.weap}',
                        style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _openPurchaseShipDialog(model),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  foregroundColor: const Color(0xFF080C10),
                ),
                child: Text('COMMISSION (⁂${model.baseValue.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")})',
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        );
      },
    );
  }
}

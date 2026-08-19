import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' show OrderingTerm;
import '../providers/database_provider.dart';
import '../game/economy/market_price_service.dart';

class CodexScreen extends ConsumerStatefulWidget {
  const CodexScreen({super.key});

  @override
  ConsumerState<CodexScreen> createState() => _CodexScreenState();
}

class _CodexScreenState extends ConsumerState<CodexScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOLAR SYSTEM CODEX & TECHNICAL MANUAL'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF00D4FF),
          labelColor: const Color(0xFF00D4FF),
          unselectedLabelColor: const Color(0xFF5A7A9A),
          isScrollable: true,
          tabs: const [
            Tab(icon: Icon(Icons.menu_book), text: 'Lore & Factions'),
            Tab(icon: Icon(Icons.engineering), text: 'Mechanics Guide'),
            Tab(icon: Icon(Icons.rocket_launch), text: 'Ship Encyclopedia'),
            Tab(icon: Icon(Icons.inventory_2), text: 'Materials Compendium'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLoreTab(),
          _buildMechanicsTab(),
          _buildShipCatalogTab(),
          _buildMaterialsTab(),
        ],
      ),
    );
  }

  // 1. Lore & Factions Tab
  Widget _buildLoreTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildCodexArticle(
          title: 'THE BELT COLONIZATION ERA (2140–PRESENT)',
          badge: 'HISTORICAL ARCHIVE',
          body: 'Following the depletion of terrestrial rare-earth deposits and atmospheric degradation on Earth, the United Nations Outer Treaty opened the Main Asteroid Belt to corporate concession claims. Autonomous mining rigs, nuclear-thermal freight tugs, and modular orbital stations blossomed from Ceres to Vesta, establishing a decentralized trillion-credit space economy.',
        ),
        const SizedBox(height: 14),
        _buildCodexArticle(
          title: 'THE FOUR HERITAGE FACTIONS',
          badge: 'DEMOGRAPHIC PROFILES',
          body: 'Corporate executives in the Sol system trace their origin to four distinct cultural and economic archetypes:\n\n'
              '🌍 EARTH: Dense financial institutions, high starting liquidity, and deep bureaucratic influence on global market prices.\n\n'
              '🌕 LUNA: High-tech vacuum laboratories, energy physics research institutions, and advanced laser development.\n\n'
              '🔴 MARS: Heavy manufacturing foundries, hardened military doctrine, and advanced hull armor casting.\n\n'
              '🪐 BELTERS: Seasoned asteroid scavengers, expert prospectors, and resilient sublight navigational veterans.',
        ),
        const SizedBox(height: 14),
        _buildCodexArticle(
          title: 'GREGG: THE HEURISTIC EXECUTIVE ADVISOR',
          badge: 'ARTIFICIAL INTELLIGENCE',
          body: 'Gregg is an advanced executive advisory neural network commissioned to monitor corporate cashflow, telemetry streams, and combat vectors. Gregg combines predictive market modeling with dry commentary on human organizational behavior.',
        ),
      ],
    );
  }

  // 2. Technical Mechanics Guide Tab
  Widget _buildMechanicsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildCodexArticle(
          title: 'SECTOR CYCLE & TURN PROGRESSION',
          badge: 'CORE GAMEPLAY',
          body: 'Each game turn represents one standard operational cycle in the solar system. Advancing the turn resets corporate action quotas (Scanning, Mining, Research, Cadets, Missions), recalculates global commodity market supply/demand, and triggers AI competitor maneuvers.',
        ),
        const SizedBox(height: 14),
        _buildCodexArticle(
          title: '6-SUBSYSTEM SHIP DAMAGE ARCHITECTURE',
          badge: 'VESSEL ENGINEERING',
          body: 'Every vessel in your fleet is engineered with 6 distinct interdependent subsystems:\n\n'
              '• Hull HP: Structural integrity. Reaching 0 HP destroys the vessel.\n'
              '• Weapon Control: Precision targeting computers and firing rate.\n'
              '• Sublight Engines: Transit speed and tactical initiative speed.\n'
              '• Maneuvering Thrusters: Evasion rating and missile dodge.\n'
              '• Life Support: Crew habitat integrity and morale retention.\n'
              '• Cargo Bays: Material freight and ore storage capacity.',
        ),
        const SizedBox(height: 14),
        _buildCodexArticle(
          title: 'WEAVING INITIATIVE COMBAT RESOLUTION',
          badge: 'TACTICAL DOCTRINE',
          body: 'Tactical combat executes in discrete rounds. Each fitted weapon battery rolls a separate initiative check modified by pilot skill and engine power. Accuracy vs. Evasion checks evaluate Weapon Control health against defender thruster ratings. On hit, armor mitigates raw kinetic force, with a 25% chance of inflicting critical collateral damage on a secondary subsystem.',
        ),
      ],
    );
  }

  // 3. Ship Catalog Encyclopedia Tab
  Widget _buildShipCatalogTab() {
    final db = ref.read(databaseProvider);

    return FutureBuilder(
      future: (db.select(db.shipModels)..orderBy([(s) => OrderingTerm.asc(s.baseValue)])).get(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator(color: Color(0xFF00D4FF)));
        }

        final ships = snapshot.data!;
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: ships.length,
          itemBuilder: (ctx, idx) {
            final s = ships[idx];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
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
                      Text(s.model, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                      Text(
                        '⁂ ${s.baseValue.toString().replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]},")}',
                        style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFFFB740)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text('Class: ${s.shipClass ?? "Civilian"} | Size: Class-${s.size}', style: const TextStyle(fontSize: 11, color: Color(0xFF00D4FF))),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      _buildMiniBadge('HP: ${s.maxHp}'),
                      _buildMiniBadge('Eng: ${s.maxEngines}'),
                      _buildMiniBadge('Mnv: ${s.maxManeuv}'),
                      _buildMiniBadge('Wpn: ${s.maxWeapCtrl}'),
                      _buildMiniBadge('Crg: ${s.maxCargo}'),
                      _buildMiniBadge('Slots: ${s.weap}W / ${s.armor}A / ${s.bays}B'),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // 4. Materials Compendium Tab
  Widget _buildMaterialsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: MarketPriceService.commoditiesConfig.entries.map((e) {
        final name = e.key;
        final info = e.value;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
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
                      Text(info.icon, style: const TextStyle(fontSize: 20)),
                      const SizedBox(width: 8),
                      Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
                    ],
                  ),
                  Text(
                    'BASE: ⁂${info.basePrice}/m³',
                    style: const TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFFFFB740)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(info.desc, style: const TextStyle(fontSize: 12, color: Color(0xFFC8DFF0))),
              const SizedBox(height: 6),
              Text('Primary Uses: ${info.uses}', style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: Color(0xFF5A7A9A))),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCodexArticle({required String title, required String badge, required String body}) {
    return Container(
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
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D4FF).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF00D4FF).withValues(alpha: 0.4)),
                ),
                child: Text(badge, style: const TextStyle(fontSize: 9, fontFamily: 'monospace', fontWeight: FontWeight.bold, color: Color(0xFF00D4FF))),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(body, style: const TextStyle(fontSize: 12, height: 1.4, color: Color(0xFFC8DFF0))),
        ],
      ),
    );
  }

  Widget _buildMiniBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF060A10),
        border: Border.all(color: const Color(0xFF1A3050)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: const TextStyle(fontFamily: 'monospace', fontSize: 10, color: Color(0xFF5A7A9A))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/database_provider.dart';
import 'new_game_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _hapticsEnabled = true;
  bool _soundFxEnabled = true;
  bool _fastAnimations = false;

  Map<String, int> _dbStats = {};
  bool _isLoadingStats = true;

  @override
  void initState() {
    super.initState();
    _loadDatabaseStats();
  }

  Future<void> _loadDatabaseStats() async {
    final db = ref.read(databaseProvider);
    final ships = await db.select(db.fleet).get();
    final crew = await db.select(db.crew).get();
    final asteroids = await db.select(db.asteroids).get();
    final missions = await db.select(db.missionHolder).get();
    final ledger = await db.select(db.corpFinanceLedger).get();
    final research = await db.select(db.corpResearch).get();
    final salvage = await db.select(db.salvage).get();

    if (mounted) {
      setState(() {
        _dbStats = {
          'Active Fleet Hulls': ships.length,
          'Crew & Cadets': crew.length,
          'Surveyed Asteroids': asteroids.length,
          'Mission Contracts': missions.length,
          'Ledger Entries': ledger.length,
          'Patent Research Tracks': research.length,
          'Salvage Wreckages': salvage.length,
        };
        _isLoadingStats = false;
      });
    }
  }

  Future<void> _confirmResetGame() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF140808),
        title: const Text('⚠️ CONFIRM CORPORATE LIQUIDATION', style: TextStyle(color: Color(0xFFFF4D6A), fontWeight: FontWeight.bold, fontSize: 14)),
        content: const Text(
          'This will permanently reset your active corporate session, fleet, research patents, and financial ledgers. This action cannot be undone.',
          style: TextStyle(color: Color(0xFFC8DFF0), fontSize: 12),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('CANCEL', style: TextStyle(color: Color(0xFF5A7A9A))),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF4D6A), foregroundColor: Colors.white),
            child: const Text('RESET & RESTART', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const NewGameScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORPORATE SETTINGS & SYSTEM DIAGNOSTICS'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Audio & Haptic Preferences
          _buildSectionHeader('SYSTEM PREFERENCES & FEEDBACK'),
          _buildToggleTile(
            title: 'Haptic Tactical Feedback',
            subtitle: 'Subtle vibration upon laser impact and critical damage events.',
            value: _hapticsEnabled,
            onChanged: (val) => setState(() => _hapticsEnabled = val),
          ),
          _buildToggleTile(
            title: 'Synthesized Audio FX',
            subtitle: 'Ambient reactor hum, bridge alerts, and weapon firing FX.',
            value: _soundFxEnabled,
            onChanged: (val) => setState(() => _soundFxEnabled = val),
          ),
          _buildToggleTile(
            title: 'High-Velocity Animations',
            subtitle: 'Accelerates transition animations and combat playback.',
            value: _fastAnimations,
            onChanged: (val) => setState(() => _fastAnimations = val),
          ),
          const SizedBox(height: 20),

          // 2. Drift Database Statistics
          _buildSectionHeader('DATABASE STORAGE & ENTITY TELEMETRY'),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1520),
              border: Border.all(color: const Color(0xFF1A3050)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: _isLoadingStats
                ? const Center(child: CircularProgressIndicator(color: Color(0xFF00D4FF)))
                : Column(
                    children: _dbStats.entries.map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.key, style: const TextStyle(fontSize: 12, color: Color(0xFFC8DFF0))),
                            Text('${e.value} records', style: const TextStyle(fontFamily: 'monospace', fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF))),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
          ),
          const SizedBox(height: 20),

          // 3. Reset Protocol
          _buildSectionHeader('CORPORATE PROTOCOLS'),
          ElevatedButton.icon(
            onPressed: _confirmResetGame,
            icon: const Icon(Icons.restart_alt, size: 18),
            label: const Text('COMMENCE NEW CORPORATE COMMISSION', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A0A0A),
              foregroundColor: const Color(0xFFFF4D6A),
              side: const BorderSide(color: Color(0xFFFF4D6A)),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 30),

          // 4. About & Version
          const Center(
            child: Column(
              children: [
                Text('harVesta v1.0.0 (Build 2026.08)', style: TextStyle(fontFamily: 'monospace', fontSize: 11, color: Color(0xFF5A7A9A))),
                SizedBox(height: 4),
                Text('Engineered with Flutter, Dart & Drift SQLite Engine', style: TextStyle(fontSize: 10, color: Color(0xFF3A5A7A))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontFamily: 'monospace', fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF00D4FF), letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildToggleTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: const Color(0xFF0D1520),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFF1A3050)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: SwitchListTile(
            title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white)),
            subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: Color(0xFF5A7A9A))),
            value: value,
            onChanged: onChanged,
            activeThumbColor: const Color(0xFF00D4FF),
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}

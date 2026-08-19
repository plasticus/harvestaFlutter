import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/game_state_provider.dart';
import 'corp_hq_screen.dart';

class NewGameScreen extends ConsumerStatefulWidget {
  const NewGameScreen({super.key});

  @override
  ConsumerState<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends ConsumerState<NewGameScreen> {
  final _formKey = GlobalKey<FormState>();
  final _corpNameController = TextEditingController(text: 'Weyland Mining Corp');
  final _stationNameController = TextEditingController(text: 'Station Alpha');

  String _heritage = 'Earth';
  int _startingSolars = 250000;
  bool _isSubmitting = false;

  final Map<String, ({String title, String bonus, Color color, IconData icon})> _heritageOptions = {
    'Earth': (
      title: 'Earth Conglomerate',
      bonus: '+3% Trade & Market Margin Discount',
      color: const Color(0xFF00D4FF),
      icon: Icons.public,
    ),
    'Mars': (
      title: 'Martian Technocracy',
      bonus: '+1 Combat Targeting & Weapons Spec',
      color: const Color(0xFFFF4D6A),
      icon: Icons.shield,
    ),
    'Ceres': (
      title: 'Belt Alliance (Ceres)',
      bonus: '+1 Asteroid Mining Yield & Extraction',
      color: const Color(0xFFFFB740),
      icon: Icons.terrain,
    ),
  };

  @override
  void dispose() {
    _corpNameController.dispose();
    _stationNameController.dispose();
    super.dispose();
  }

  Future<void> _commissionCorp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      await ref.read(gameStateProvider.notifier).commissionNewCorp(
            corpName: _corpNameController.text.trim(),
            stationName: _stationNameController.text.trim(),
            heritage: _heritage,
            startingSolars: _startingSolars,
          );

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const CorpHqScreen()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Commissioning Failed: $e'),
            backgroundColor: const Color(0xFFFF4D6A),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORPORATE COMMISSIONING PROTOCOL'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Title & Subtitle
                  const Text(
                    'Establish Corporation',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00D4FF),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Provision your extraction charter, space station hub, and starter extraction squadron.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5A7A9A),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Corporation Name
                  TextFormField(
                    controller: _corpNameController,
                    decoration: const InputDecoration(
                      labelText: 'Corporation Designation',
                      hintText: 'e.g. Weyland-Yutani, Aegis Dynamics',
                      prefixIcon: Icon(Icons.business, color: Color(0xFF00D4FF)),
                      filled: true,
                      fillColor: Color(0xFF0D1520),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1A3050)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1A3050)),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Please provide a valid corporation name.';
                      }
                      if (val.trim().length > 30) {
                        return 'Corporation name must be 30 characters or less.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Space Station Name
                  TextFormField(
                    controller: _stationNameController,
                    decoration: const InputDecoration(
                      labelText: 'Station Designation',
                      hintText: 'e.g. Station Alpha, Outpost Theta',
                      prefixIcon: Icon(Icons.satellite_alt, color: Color(0xFFFFB740)),
                      filled: true,
                      fillColor: Color(0xFF0D1520),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1A3050)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF1A3050)),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Please provide a space station designation.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),

                  // Heritage Origin Selection
                  const Text(
                    'HERITAGE & SYSTEM SPECIALIZATION',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      letterSpacing: 1.5,
                      color: Color(0xFF00D4FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._heritageOptions.entries.map((entry) {
                    final isSelected = _heritage == entry.key;
                    final h = entry.value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: InkWell(
                        onTap: () => setState(() => _heritage = entry.key),
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF0F1E30) : const Color(0xFF0D1520),
                            border: Border.all(
                              color: isSelected ? h.color : const Color(0xFF1A3050),
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(h.icon, color: h.color, size: 28),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      h.title,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      h.bonus,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: h.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                Icon(Icons.check_circle, color: h.color),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),

                  // Starting Capital Tier
                  const Text(
                    'INITIAL VENTURE CAPITAL TIER',
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      letterSpacing: 1.5,
                      color: Color(0xFF00D4FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildSolarsTierButton(100000, 'Hardcore', '⁂100,000'),
                      const SizedBox(width: 10),
                      _buildSolarsTierButton(250000, 'Standard', '⁂250,000'),
                      const SizedBox(width: 10),
                      _buildSolarsTierButton(500000, 'Executive', '⁂500,000'),
                    ],
                  ),
                  const SizedBox(height: 36),

                  // Submit Button
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _isSubmitting ? null : _commissionCorp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D4FF),
                        foregroundColor: const Color(0xFF080C10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Color(0xFF080C10),
                              ),
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.rocket_launch, size: 20),
                                SizedBox(width: 10),
                                Text(
                                  'COMMISSION CORPORATION',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSolarsTierButton(int amount, String label, String displayAmount) {
    final isSelected = _startingSolars == amount;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _startingSolars = amount),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0F1E30) : const Color(0xFF0D1520),
            border: Border.all(
              color: isSelected ? const Color(0xFFFFB740) : const Color(0xFF1A3050),
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                displayAmount,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: Color(0xFFFFB740),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

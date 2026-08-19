import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../data/app_database.dart';

class OrbitalRadarScope extends StatefulWidget {
  final List<Asteroid> asteroids;
  final List<SalvageEntry> salvageCaches;
  final String? selectedAsteroidName;
  final ValueChanged<Asteroid> onSelectAsteroid;
  final VoidCallback? onMineSelected;

  const OrbitalRadarScope({
    super.key,
    required this.asteroids,
    this.salvageCaches = const [],
    this.selectedAsteroidName,
    required this.onSelectAsteroid,
    this.onMineSelected,
  });

  @override
  State<OrbitalRadarScope> createState() => _OrbitalRadarScopeState();
}

class _OrbitalRadarScopeState extends State<OrbitalRadarScope> with SingleTickerProviderStateMixin {
  late AnimationController _sweepController;

  @override
  void initState() {
    super.initState();
    _sweepController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _sweepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedAsteroid = widget.asteroids.where((a) => a.asteroidName == widget.selectedAsteroidName).firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Radar Screen
        Container(
          height: 360,
          decoration: BoxDecoration(
            color: const Color(0xFF040810),
            border: Border.all(color: const Color(0xFF00D4FF).withValues(alpha: 0.4)),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D4FF).withValues(alpha: 0.1),
                blurRadius: 16,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AnimatedBuilder(
              animation: _sweepController,
              builder: (context, _) {
                return CustomPaint(
                  painter: _RadarCustomPainter(
                    sweepAngle: _sweepController.value * 2 * math.pi,
                    asteroids: widget.asteroids,
                    salvageCaches: widget.salvageCaches,
                    selectedAsteroidName: widget.selectedAsteroidName,
                  ),
                  child: GestureDetector(
                    onTapUp: (details) => _handleRadarTap(details, context),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Selected Target Inspection Card
        if (selectedAsteroid != null) ...[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF0D1520),
              border: Border.all(color: const Color(0xFF00D4FF)),
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
                        const Icon(Icons.gps_fixed, color: Color(0xFF00D4FF), size: 18),
                        const SizedBox(width: 8),
                        Text(
                          selectedAsteroid.asteroidName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                    if (widget.onMineSelected != null)
                      ElevatedButton.icon(
                        onPressed: widget.onMineSelected,
                        icon: const Icon(Icons.terrain, size: 16),
                        label: const Text('DEPLOY MINING EXPEDITION', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D4FF),
                          foregroundColor: const Color(0xFF080C10),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildResourcePill('⚡ Cond', selectedAsteroid.conductiveM, const Color(0xFF00D4FF)),
                    const SizedBox(width: 8),
                    _buildResourcePill('🏗️ ZeroG', selectedAsteroid.zeroGM, const Color(0xFFFFB740)),
                    const SizedBox(width: 8),
                    _buildResourcePill('🔩 Surf', selectedAsteroid.surfaceM, const Color(0xFF5A7A9A)),
                    const SizedBox(width: 8),
                    _buildResourcePill('🫧 Life', selectedAsteroid.lifeSuppG, const Color(0xFF39FF98)),
                    const SizedBox(width: 8),
                    _buildResourcePill('⛽ Fuel', selectedAsteroid.fuelG, const Color(0xFFFF8A2B)),
                    const SizedBox(width: 8),
                    _buildResourcePill('💎 OVE', selectedAsteroid.ove, const Color(0xFFC084FC)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildResourcePill(String label, int val, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          border: Border.all(color: color.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            Text(label, style: TextStyle(fontSize: 9, color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text('$val%', style: const TextStyle(fontSize: 10, fontFamily: 'monospace', fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _handleRadarTap(TapUpDetails details, BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = renderBox.size;
    final center = Offset(size.width / 2, size.height / 2);
    final tapPos = details.localPosition;

    final maxRadius = math.min(size.width, size.height) * 0.44;

    for (var i = 0; i < widget.asteroids.length; i++) {
      final a = widget.asteroids[i];
      final angle = (i * (2 * math.pi / widget.asteroids.length)) + (a.id * 0.37);
      final r = ((a.id % 5 + 1) / 6.0) * maxRadius + 30;

      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      final distance = (tapPos - Offset(x, y)).distance;
      if (distance < 24) {
        widget.onSelectAsteroid(a);
        return;
      }
    }
  }
}

class _RadarCustomPainter extends CustomPainter {
  final double sweepAngle;
  final List<Asteroid> asteroids;
  final List<SalvageEntry> salvageCaches;
  final String? selectedAsteroidName;

  _RadarCustomPainter({
    required this.sweepAngle,
    required this.asteroids,
    required this.salvageCaches,
    this.selectedAsteroidName,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) * 0.44;

    final gridPaint = Paint()
      ..color = const Color(0xFF00D4FF).withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final ringPaint = Paint()
      ..color = const Color(0xFF00D4FF).withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // 1. Concentric Range Rings
    canvas.drawCircle(center, maxRadius * 0.25, ringPaint);
    canvas.drawCircle(center, maxRadius * 0.50, ringPaint);
    canvas.drawCircle(center, maxRadius * 0.75, ringPaint);
    canvas.drawCircle(center, maxRadius, ringPaint);

    // 2. Crosshairs
    canvas.drawLine(Offset(center.dx - maxRadius, center.dy), Offset(center.dx + maxRadius, center.dy), gridPaint);
    canvas.drawLine(Offset(center.dx, center.dy - maxRadius), Offset(center.dx, center.dy + maxRadius), gridPaint);

    // 3. Rotating Sweep Line with Phosphor Trail
    final sweepPaint = Paint()
      ..shader = SweepGradient(
        center: FractionalOffset.center,
        startAngle: 0.0,
        endAngle: 2 * math.pi,
        colors: [
          const Color(0xFF00D4FF).withValues(alpha: 0.0),
          const Color(0xFF00D4FF).withValues(alpha: 0.0),
          const Color(0xFF00D4FF).withValues(alpha: 0.2),
          const Color(0xFF00D4FF).withValues(alpha: 0.6),
        ],
        stops: const [0.0, 0.75, 0.95, 1.0],
        transform: GradientRotation(sweepAngle),
      ).createShader(Rect.fromCircle(center: center, radius: maxRadius));

    canvas.drawCircle(center, maxRadius, sweepPaint);

    // 4. Center Orbital Station Beacon
    final stationPaint = Paint()..color = const Color(0xFF39FF98);
    canvas.drawCircle(center, 5.0, stationPaint);
    final stationPulse = Paint()
      ..color = const Color(0xFF39FF98).withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(center, 9.0, stationPulse);

    // 5. Scanned Asteroid Blips
    for (var i = 0; i < asteroids.length; i++) {
      final a = asteroids[i];
      final isSelected = a.asteroidName == selectedAsteroidName;
      final angle = (i * (2 * math.pi / asteroids.length)) + (a.id * 0.37);
      final r = ((a.id % 5 + 1) / 6.0) * maxRadius + 30;

      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      final pos = Offset(x, y);

      // Blip Color based on resource signature
      Color blipColor = const Color(0xFFFFB740);
      if (a.conductiveM > 25) blipColor = const Color(0xFF00D4FF);
      if (a.lifeSuppG > 25) blipColor = const Color(0xFF39FF98);
      if (a.ove > 15) blipColor = const Color(0xFFC084FC);

      final blipPaint = Paint()..color = blipColor;
      canvas.drawCircle(pos, isSelected ? 6.0 : 4.0, blipPaint);

      // Selected Reticle
      if (isSelected) {
        final reticlePaint = Paint()
          ..color = const Color(0xFF00D4FF)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        canvas.drawCircle(pos, 12.0, reticlePaint);

        // Target Label
        final tp = TextPainter(
          text: TextSpan(
            text: a.asteroidName,
            style: const TextStyle(color: Color(0xFF00D4FF), fontSize: 9, fontFamily: 'monospace', fontWeight: FontWeight.bold),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(x + 14, y - 6));
      }
    }
  }

  @override
  bool shouldRepaint(covariant _RadarCustomPainter oldDelegate) {
    return oldDelegate.sweepAngle != sweepAngle ||
        oldDelegate.selectedAsteroidName != selectedAsteroidName ||
        oldDelegate.asteroids.length != asteroids.length;
  }
}

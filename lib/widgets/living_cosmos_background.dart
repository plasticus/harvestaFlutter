import 'dart:math' as math;
import 'package:flutter/material.dart';

class LivingCosmosBackground extends StatefulWidget {
  final Widget child;
  final bool showMeteors;
  final bool showAsteroids;

  const LivingCosmosBackground({
    super.key,
    required this.child,
    this.showMeteors = true,
    this.showAsteroids = true,
  });

  @override
  State<LivingCosmosBackground> createState() => _LivingCosmosBackgroundState();
}

class _Star {
  final double x; // 0.0 to 1.0
  final double y; // 0.0 to 1.0
  final double size;
  final Color color;
  final Color glowColor;
  final bool isBright;
  final double baseAlpha;
  final double twinkleSpeed;
  final double twinklePhase;

  _Star({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.glowColor,
    required this.isBright,
    required this.baseAlpha,
    required this.twinkleSpeed,
    required this.twinklePhase,
  });
}

class _DriftingAsteroid {
  double x;
  double y;
  final double radius;
  final double speedX;
  final double speedY;
  double rotation;
  final double rotSpeed;
  final List<double> vertexOffsets; // Polygon jitter

  _DriftingAsteroid({
    required this.x,
    required this.y,
    required this.radius,
    required this.speedX,
    required this.speedY,
    required this.rotation,
    required this.rotSpeed,
    required this.vertexOffsets,
  });
}

class _Meteor {
  double x;
  double y;
  final double angle;
  final double length;
  final double speed;
  final Color color;
  double life = 1.0; // 1.0 down to 0.0

  _Meteor({
    required this.x,
    required this.y,
    required this.angle,
    required this.length,
    required this.speed,
    required this.color,
  });
}

class _LivingCosmosBackgroundState extends State<LivingCosmosBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Star> _stars = [];
  final List<_DriftingAsteroid> _asteroids = [];
  final List<_Meteor> _meteors = [];
  final math.Random _rng = math.Random(1337);

  double _lastMeteorSpawn = 0;

  @override
  void initState() {
    super.initState();
    _initCosmos();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  void _initCosmos() {
    // 1. Generate 350 persistent stars
    const starPalette = [
      (color: Color(0xFFFFFFFF), glow: Color(0xE6FFFFFF)),
      (color: Color(0xFFCBE6FF), glow: Color(0xD9CBE6FF)),
      (color: Color(0xFFFFEEC2), glow: Color(0xD9FFEEC2)),
      (color: Color(0xFF00E5FF), glow: Color(0xE600E5FF)),
      (color: Color(0xFFFFD54F), glow: Color(0xBFFFD54F)),
    ];

    for (var i = 0; i < 350; i++) {
      final pal = starPalette[_rng.nextInt(starPalette.length)];
      final isBright = _rng.nextDouble() < 0.06;
      final isMid = _rng.nextDouble() < 0.28;

      _stars.add(
        _Star(
          x: _rng.nextDouble(),
          y: _rng.nextDouble(),
          size: isBright
              ? _rng.nextDouble() * 1.5 + 1.2
              : (isMid ? _rng.nextDouble() * 0.8 + 0.7 : _rng.nextDouble() * 0.5 + 0.3),
          color: pal.color,
          glowColor: pal.glow,
          isBright: isBright,
          baseAlpha: isBright ? _rng.nextDouble() * 0.3 + 0.7 : _rng.nextDouble() * 0.5 + 0.3,
          twinkleSpeed: _rng.nextDouble() * 2.5 + 1.0,
          twinklePhase: _rng.nextDouble() * math.pi * 2,
        ),
      );
    }

    // 2. Generate 8 drifting background asteroid silhouettes
    for (var i = 0; i < 8; i++) {
      final vertexOffsets = List.generate(7, (_) => 0.7 + _rng.nextDouble() * 0.5);
      _asteroids.add(
        _DriftingAsteroid(
          x: _rng.nextDouble(),
          y: _rng.nextDouble(),
          radius: _rng.nextDouble() * 16.0 + 8.0,
          speedX: (_rng.nextDouble() * 0.0004 + 0.0001) * (_rng.nextBool() ? 1 : -1),
          speedY: (_rng.nextDouble() * 0.0002 + 0.00005) * (_rng.nextBool() ? 1 : -1),
          rotation: _rng.nextDouble() * math.pi * 2,
          rotSpeed: (_rng.nextDouble() * 0.008 + 0.002) * (_rng.nextBool() ? 1 : -1),
          vertexOffsets: vertexOffsets,
        ),
      );
    }
  }

  void _updateCosmos(double dt) {
    // Update Asteroids
    for (final a in _asteroids) {
      a.x += a.speedX;
      a.y += a.speedY;
      a.rotation += a.rotSpeed;

      if (a.x < -0.1) a.x = 1.1;
      if (a.x > 1.1) a.x = -0.1;
      if (a.y < -0.1) a.y = 1.1;
      if (a.y > 1.1) a.y = -0.1;
    }

    // Update Meteors
    for (var i = _meteors.length - 1; i >= 0; i--) {
      final m = _meteors[i];
      m.x += math.cos(m.angle) * m.speed;
      m.y += math.sin(m.angle) * m.speed;
      m.life -= 0.025;
      if (m.life <= 0 || m.x < -0.2 || m.y > 1.2) {
        _meteors.removeAt(i);
      }
    }

    // Spawn Meteors periodically (Every ~4-6 seconds)
    _lastMeteorSpawn += dt;
    if (_lastMeteorSpawn > 4.5 && widget.showMeteors) {
      if (_rng.nextDouble() < 0.25) {
        _lastMeteorSpawn = 0;
        final isCyan = _rng.nextBool();
        _meteors.add(
          _Meteor(
            x: _rng.nextDouble() * 0.7 + 0.3,
            y: _rng.nextDouble() * 0.3,
            angle: math.pi * 0.75 + (_rng.nextDouble() * 0.2 - 0.1),
            length: _rng.nextDouble() * 120.0 + 80.0,
            speed: _rng.nextDouble() * 0.025 + 0.02,
            color: isCyan ? const Color(0xFF00E5FF) : const Color(0xFFFFB740),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // 1. Cosmic Canvas
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              _updateCosmos(0.016);
              return CustomPaint(
                painter: _CosmosPainter(
                  time: _controller.value * 2 * math.pi,
                  stars: _stars,
                  asteroids: widget.showAsteroids ? _asteroids : const [],
                  meteors: widget.showMeteors ? _meteors : const [],
                ),
              );
            },
          ),
        ),

        // 2. Child Application Layer
        widget.child,
      ],
    );
  }
}

class _CosmosPainter extends CustomPainter {
  final double time;
  final List<_Star> stars;
  final List<_DriftingAsteroid> asteroids;
  final List<_Meteor> meteors;

  _CosmosPainter({
    required this.time,
    required this.stars,
    required this.asteroids,
    required this.meteors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Deep Space Base Gradient with Soft Nebulae
    final bgRect = Offset.zero & size;
    final bgPaint = Paint()
      ..shader = const RadialGradient(
        center: Alignment(0.4, -0.6),
        radius: 1.4,
        colors: [
          Color(0xFF081224), // Subtle deep blue/teal nebula core
          Color(0xFF040812),
          Color(0xFF020408),
        ],
        stops: [0.0, 0.5, 1.0],
      ).createShader(bgRect);
    canvas.drawRect(bgRect, bgPaint);

    // 2. Distant Celestial Glows (Jupiter / Mars / Vesta)
    final jupiterCenter = Offset(size.width * 0.88, size.height * 0.18);
    final jupiterGlow = Paint()
      ..shader = RadialGradient(
        colors: [
          const Color(0xFFFFB740).withValues(alpha: 0.12),
          const Color(0xFFFFB740).withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromCircle(center: jupiterCenter, radius: 90));
    canvas.drawCircle(jupiterCenter, 90, jupiterGlow);

    final jupiterPaint = Paint()..color = const Color(0xFFC88A3B).withValues(alpha: 0.25);
    canvas.drawCircle(jupiterCenter, 24, jupiterPaint);

    // 3. Twinkling Stars
    for (final s in stars) {
      final currentAlpha = (s.baseAlpha + math.sin(time * s.twinkleSpeed + s.twinklePhase) * 0.35)
          .clamp(0.15, 1.0);

      final px = s.x * size.width;
      final py = s.y * size.height;

      final starPaint = Paint()
        ..color = s.color.withValues(alpha: currentAlpha)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(px, py), s.size, starPaint);

      // Diffraction starburst crosshairs on bright twinkling stars
      if (s.isBright && currentAlpha > 0.70) {
        final spikePaint = Paint()
          ..color = s.glowColor.withValues(alpha: currentAlpha * 0.6)
          ..strokeWidth = 0.8;

        canvas.drawLine(Offset(px - 5, py), Offset(px + 5, py), spikePaint);
        canvas.drawLine(Offset(px, py - 5), Offset(px, py + 5), spikePaint);
      }
    }

    // 4. Drifting Irregular Asteroid Silhouettes
    for (final a in asteroids) {
      final ax = a.x * size.width;
      final ay = a.y * size.height;

      final path = Path();
      final numPoints = a.vertexOffsets.length;
      for (var i = 0; i < numPoints; i++) {
        final angle = a.rotation + (i * 2 * math.pi / numPoints);
        final r = a.radius * a.vertexOffsets[i];
        final vx = ax + r * math.cos(angle);
        final vy = ay + r * math.sin(angle);
        if (i == 0) {
          path.moveTo(vx, vy);
        } else {
          path.lineTo(vx, vy);
        }
      }
      path.close();

      final astPaint = Paint()
        ..color = const Color(0xFF0F1B2B).withValues(alpha: 0.45)
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, astPaint);

      final astBorder = Paint()
        ..color = const Color(0xFF1E3550).withValues(alpha: 0.35)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
      canvas.drawPath(path, astBorder);
    }

    // 5. Shooting Meteors with Glowing Tails
    for (final m in meteors) {
      final mx = m.x * size.width;
      final my = m.y * size.height;

      final tailX = mx - math.cos(m.angle) * m.length;
      final tailY = my - math.sin(m.angle) * m.length;

      final meteorPaint = Paint()
        ..shader = LinearGradient(
          colors: [
            m.color.withValues(alpha: 0.0),
            m.color.withValues(alpha: m.life * 0.9),
            Colors.white.withValues(alpha: m.life),
          ],
          stops: const [0.0, 0.85, 1.0],
        ).createShader(Rect.fromPoints(Offset(tailX, tailY), Offset(mx, my)))
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(Offset(tailX, tailY), Offset(mx, my), meteorPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _CosmosPainter oldDelegate) {
    return true; // Continuously animated starfield & meteors
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/widgets/orbital_radar_scope.dart';

void main() {
  testWidgets('OrbitalRadarScope renders concentric range rings and scanned asteroid blips', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1000, 700));

    final sampleAsteroids = [
      const Asteroid(
        id: 1,
        asteroidName: 'Ceres-Alpha-01',
        m3: 1000,
        surfaceM: 20,
        zeroGM: 30,
        conductiveM: 25,
        lifeSuppG: 10,
        fuelG: 10,
        ove: 5,
        waterIce: 0,
      ),
      const Asteroid(
        id: 2,
        asteroidName: 'Vesta-Beta-09',
        m3: 1400,
        surfaceM: 10,
        zeroGM: 15,
        conductiveM: 10,
        lifeSuppG: 20,
        fuelG: 35,
        ove: 10,
        waterIce: 0,
      ),
    ];

    String? selected;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OrbitalRadarScope(
            asteroids: sampleAsteroids,
            selectedAsteroidName: 'Ceres-Alpha-01',
            onSelectAsteroid: (a) {
              selected = a.asteroidName;
            },
            onMineSelected: () {},
          ),
        ),
      ),
    );

    // Pump a single frame for repeating radar sweep animation
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('Ceres-Alpha-01'), findsWidgets);
    expect(find.text('DEPLOY MINING EXPEDITION'), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
    expect(selected, isNull);
  });
}

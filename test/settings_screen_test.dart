import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/providers/database_provider.dart';
import 'package:harvesta/screens/settings_screen.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
  });

  tearDown(() async {
    await db.close();
  });

  testWidgets('SettingsScreen renders preferences, entity stats, and reset dialog', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
        ],
        child: const MaterialApp(
          home: SettingsScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('CORPORATE SETTINGS & SYSTEM DIAGNOSTICS'), findsOneWidget);
    expect(find.text('Haptic Tactical Feedback'), findsOneWidget);
    expect(find.text('DATABASE STORAGE & ENTITY TELEMETRY'), findsOneWidget);
    expect(find.text('Surveyed Asteroids'), findsOneWidget);

    // Tap reset button to open confirmation dialog
    await tester.tap(find.text('COMMENCE NEW CORPORATE COMMISSION'));
    await tester.pumpAndSettle();

    expect(find.text('⚠️ CONFIRM CORPORATE LIQUIDATION'), findsOneWidget);
  });
}

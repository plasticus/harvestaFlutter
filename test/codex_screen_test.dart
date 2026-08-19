import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/providers/database_provider.dart';
import 'package:harvesta/screens/codex_screen.dart';

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

  testWidgets('CodexScreen renders tabs, lore, mechanics, ship models, and commodities', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
        ],
        child: const MaterialApp(
          home: CodexScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('SOLAR SYSTEM CODEX & TECHNICAL MANUAL'), findsOneWidget);
    expect(find.text('THE BELT COLONIZATION ERA (2140–PRESENT)'), findsOneWidget);

    // Switch to Mechanics Guide tab
    await tester.tap(find.text('Mechanics Guide'));
    await tester.pumpAndSettle();

    expect(find.text('SECTOR CYCLE & TURN PROGRESSION'), findsOneWidget);

    // Switch to Ship Encyclopedia tab
    await tester.tap(find.text('Ship Encyclopedia'));
    await tester.pumpAndSettle();

    expect(find.text('Magpie'), findsWidgets);

    // Switch to Materials Compendium tab
    await tester.tap(find.text('Materials Compendium'));
    await tester.pumpAndSettle();

    expect(find.text('Conductive Metals'), findsWidgets);
    expect(find.text('Zero-G Construction Metals'), findsWidgets);
  });
}

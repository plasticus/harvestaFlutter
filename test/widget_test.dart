import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';
import 'package:harvesta/main.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/providers/database_provider.dart';

void main() {
  testWidgets('App boots into commissioning flow and navigates to Corp HQ after commissioning', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 960);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final testDb = AppDatabase(NativeDatabase.memory());

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(testDb),
        ],
        child: const HarVestaApp(),
      ),
    );

    // Initial pump shows bootstrap screen
    expect(find.text('harVesta'), findsOneWidget);

    // Allow bootstrap to complete
    await tester.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 300));
    });
    await tester.pump();

    // Now shows NewGameScreen
    expect(find.text('CORPORATE COMMISSIONING PROTOCOL'), findsOneWidget);
    expect(find.text('COMMISSION CORPORATION'), findsOneWidget);

    // Scroll to button and tap
    await tester.ensureVisible(find.text('COMMISSION CORPORATION'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('COMMISSION CORPORATION'));

    await tester.runAsync(() async {
      await Future<void>.delayed(const Duration(milliseconds: 500));
    });
    await tester.pumpAndSettle();

    // Verify we arrived at Corp HQ dashboard
    expect(find.text('OPERATIONS READINESS'), findsOneWidget);
    expect(find.text('SECTOR OPERATIONS'), findsOneWidget);
    expect(find.text('ADVANCE TURN'), findsOneWidget);

    await testDb.close();
  });
}

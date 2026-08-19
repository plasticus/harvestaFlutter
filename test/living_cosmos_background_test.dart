import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harvesta/widgets/living_cosmos_background.dart';

void main() {
  testWidgets('LivingCosmosBackground renders custom starfield and child widget', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1000, 700));

    await tester.pumpWidget(
      const MaterialApp(
        home: LivingCosmosBackground(
          child: Scaffold(
            body: Center(
              child: Text('harVesta Cosmos Online'),
            ),
          ),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.text('harVesta Cosmos Online'), findsOneWidget);
    expect(find.byType(CustomPaint), findsWidgets);
  });
}

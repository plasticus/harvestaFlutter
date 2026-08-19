import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/ai/ai_corp_service.dart';
import 'package:harvesta/providers/database_provider.dart';
import 'package:harvesta/providers/game_state_provider.dart';
import 'package:harvesta/screens/corporate_intelligence_screen.dart';

class _TestGameStateNotifier extends GameStateNotifier {
  final String testCorp;
  _TestGameStateNotifier(this.testCorp);

  @override
  GameState build() {
    return GameState(
      corpName: testCorp,
      gameTurn: 1,
      solars: 1500000,
      isCommissioned: true,
      isLoading: false,
    );
  }
}

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late AiCorpService aiService;

  const playerCorp = 'Astra Vanguard Corp';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    aiService = AiCorpService(db, customRng: Random(42));

    await provisioningService.provisionNewGame(
      corpName: playerCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 9 AI Rival Corporations Verification', () {
    test('Provisions and simulates turns for all 6 AI rival corporations', () async {
      await aiService.ensureRivalsProvisioned();

      // Verify all 6 rivals exist in database
      for (final rival in AiCorpService.rivalProfiles) {
        final solars = await db.inventoryDao.getItemQuantity(rival.corpName, 'Solars');
        expect(solars, greaterThan(0));
      }

      // Simulate a turn for all AI rivals
      await aiService.simulateTurnForAllAi(turn: 2, playerCorp: playerCorp);

      // Verify leaderboard rankings table
      final leaderboard = await aiService.getRankedLeaderboard(
        playerCorp: playerCorp,
        turn: 2,
      );

      expect(leaderboard.length, equals(7)); // Player + 6 Rivals
      expect(leaderboard.first.rank, equals(1));
      expect(leaderboard.last.rank, equals(7));

      for (var i = 0; i < leaderboard.length - 1; i++) {
        expect(leaderboard[i].netWorth, greaterThanOrEqualTo(leaderboard[i + 1].netWorth));
      }
    });

    testWidgets('CorporateIntelligenceScreen renders rankings, chart, and dossiers', (tester) async {
      await tester.binding.setSurfaceSize(const Size(1280, 800));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            databaseProvider.overrideWithValue(db),
            gameStateProvider.overrideWith(() => _TestGameStateNotifier(playerCorp)),
          ],
          child: const MaterialApp(
            home: CorporateIntelligenceScreen(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('SOL SYSTEM CORPORATE STANDINGS'), findsOneWidget);
      expect(find.text(playerCorp), findsWidgets);
      expect(find.text('Weyland-Yutani'), findsWidgets);

      // Switch to Net Worth Trends tab
      await tester.tap(find.text('Net Worth Trends'));
      await tester.pumpAndSettle();

      expect(find.text('SYSTEM NET WORTH COMPARATIVE DISTRIBUTION'), findsOneWidget);

      // Switch to Rival Dossiers tab
      await tester.tap(find.text('Rival Dossiers'));
      await tester.pumpAndSettle();

      expect(find.textContaining('Sir Peter Weyland'), findsOneWidget);
      expect(find.textContaining('Adrian Veidt'), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/providers/database_provider.dart';
import 'package:harvesta/providers/game_state_provider.dart';
import 'package:harvesta/screens/combat_screen.dart';

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

  const testCorp = 'Starlight Defense Corp';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  testWidgets('Phase 8 CombatScreen loads participants, renders arena, and displays playback dock', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1280, 800));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          databaseProvider.overrideWithValue(db),
          gameStateProvider.overrideWith(() => _TestGameStateNotifier(testCorp)),
        ],
        child: const MaterialApp(
          home: CombatScreen(
            playerSquadronName: 'Alpha Squadron',
            enemySquadronName: 'Void Wolves',
            enemyCorpName: 'Void Wolves Raider Clan',
            threatIndex: 1,
            battleOrigin: 'Sector Patrol Interception',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('SECTOR PATROL INTERCEPTION // SQUADRON ENGAGEMENT'), findsOneWidget);
    expect(find.text('Alpha Squadron'), findsWidgets);
    expect(find.text('Void Wolves'), findsWidgets);
    expect(find.text('SKIP TO END'), findsOneWidget);

    // Tap Skip to End to finish playback
    await tester.tap(find.text('SKIP TO END'));
    await tester.pumpAndSettle();

    expect(find.text('COMMIT AFTER-ACTION REPORT & RETURN'), findsOneWidget);
  });
}

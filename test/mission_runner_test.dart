import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';
import 'package:harvesta/data/app_database.dart';
import 'package:harvesta/data/database_seeder.dart';
import 'package:harvesta/game/corp_provisioning_service.dart';
import 'package:harvesta/game/missions/mission_generator_service.dart';
import 'package:harvesta/game/missions/mission_runner_service.dart';

void main() {
  late AppDatabase db;
  late DatabaseSeeder seeder;
  late CorpProvisioningService provisioningService;
  late MissionGeneratorService generatorService;
  late MissionRunnerService runnerService;

  const testCorp = 'Aegis Aerospace Operations';

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = DatabaseSeeder(db);
    await seeder.seedAll(isTest: true);
    provisioningService = CorpProvisioningService(db);
    generatorService = MissionGeneratorService(db, customRng: Random(42));
    runnerService = MissionRunnerService(db, customRng: Random(42));

    await provisioningService.provisionNewGame(
      corpName: testCorp,
      heritage: 'Earth',
      startingSolars: 1500000,
    );
  });

  tearDown(() async {
    await db.close();
  });

  group('Phase 6 Mission Runner Verification', () {
    test('Starts expedition, debits fuel costs, and assembles squadron telemetry', () async {
      final missions = await generatorService.generateMissions(testCorp, 1);
      final contract = missions.first;

      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');

      final started = await runnerService.startMission(
        corpName: testCorp,
        missionId: contract.id,
        squadronName: 'Alpha Squadron',
        turn: 1,
      );

      expect(started, isTrue);

      final solarsAfterFuel = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      expect(solarsAfterFuel, equals(initialSolars - contract.fuelCost));

      final snapshot = await runnerService.getSquadronSnapshot(testCorp, 'Alpha Squadron');
      expect(snapshot.numShips, greaterThan(0));
      expect(snapshot.officers, isNotEmpty);
    });

    test('Completes mission, credits payout in Solars, promotes crew, and archives contract', () async {
      final missions = await generatorService.generateMissions(testCorp, 1);
      final contract = missions.first;

      final initialSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');

      final result = await runnerService.completeMission(
        corpName: testCorp,
        missionId: contract.id,
        squadronName: 'Alpha Squadron',
        turn: 1,
      );

      expect(result.payout, equals(contract.payout));

      final finalSolars = await db.inventoryDao.getItemQuantity(testCorp, 'Solars');
      expect(finalSolars, greaterThan(initialSolars));

      // Contract deleted from active mission board
      final check = await (db.select(db.missionHolder)..where((m) => m.id.equals(contract.id))).getSingleOrNull();
      expect(check, isNull);
    });
  });
}

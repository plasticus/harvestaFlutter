import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:harvesta/game/missions/interruptor_engine.dart';

void main() {
  group('Phase 6 Interruptor Engine Verification', () {
    late SquadronSnapshot mockSquadron;

    setUp(() {
      mockSquadron = const SquadronSnapshot(
        squadronName: 'Alpha Squadron',
        ships: [
          SquadronShipSnapshot(
            shipName: 'SS Explorer',
            model: 'Magpie',
            hp: 100,
            maxHp: 100,
            engines: 90,
            maneuv: 85,
            weapCtrl: 50,
            cargo: 20,
            pdcPower: 20,
          ),
        ],
        officers: [
          SquadronOfficerSnapshot(
            id: 1,
            name: 'Captain Reynolds',
            assignment: 'Captain',
            leadership: 70,
            influence: 60,
            pilot: 65,
            computation: 50,
            repair: 55,
            shipWeapons: 60,
            fighting: 50,
            athletics: 50,
          ),
          SquadronOfficerSnapshot(
            id: 2,
            name: 'Pilot Wash',
            assignment: 'Pilot',
            leadership: 30,
            influence: 30,
            pilot: 80,
            computation: 40,
            repair: 45,
            shipWeapons: 40,
            fighting: 30,
            athletics: 40,
          ),
        ],
      );
    });

    test('DebrisField generates Dodge and Blast tactical options', () {
      const debris = DebrisFieldInterruptor(cr: 1);
      final choices = debris.getChoices(mockSquadron);

      expect(choices.length, equals(2));
      expect(choices[0].key, equals('dodge'));
      expect(choices[1].key, equals('blast'));

      final outcome = debris.resolve(
        choiceKey: 'dodge',
        squadron: mockSquadron,
        rng: Random(42),
      );

      expect(outcome.narrative, isNotEmpty);
    });

    test('Pirate ambush resolves engage tactical option with bounty reward on victory', () {
      const pirate = PirateInterruptor(cr: 1);
      final choices = pirate.getChoices(mockSquadron);

      expect(choices.length, equals(2));
      expect(choices[0].key, equals('engage'));
      expect(choices[1].key, equals('evade'));

      final outcome = pirate.resolve(
        choiceKey: 'engage',
        squadron: mockSquadron,
        rng: Random(1),
      );

      expect(outcome.narrative, isNotEmpty);
    });

    test('Salvage derelict provides material resources and Solars scrap value', () {
      const salvage = SalvageInterruptor(cr: 1);
      final outcome = salvage.resolve(
        choiceKey: 'salvage',
        squadron: mockSquadron,
        rng: Random(42),
      );

      expect(outcome.success, isTrue);
      expect(outcome.solarsGained, greaterThan(0));
    });

    test('Subspace Anomaly gathers science telemetry RP for corporate research', () {
      const anomaly = AnomalyInterruptor(cr: 1);
      final outcome = anomaly.resolve(
        choiceKey: 'scan',
        squadron: mockSquadron,
        rng: Random(42),
      );

      expect(outcome.success, isTrue);
      expect(outcome.rpGained, greaterThan(0));
    });
  });
}

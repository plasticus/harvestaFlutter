import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:drift/drift.dart';

import 'app_database.dart';
import 'seed_data/ship_models_seed.dart';
import 'seed_data/ship_mods_available_seed.dart';
import 'seed_data/mission_interruptors_seed.dart';
import 'seed_data/mission_text_generator_seed.dart';
import 'seed_data/scavenge_list_seed.dart';
import 'seed_data/crew_generate_seed.dart';

class DatabaseSeeder {
  final AppDatabase db;

  DatabaseSeeder(this.db);

  /// Run all seeders if the database tables are empty
  Future<void> seedAll({bool isTest = false}) async {
    await seedGameData();
    await seedShipModels();
    await seedShipModsAvailable();
    await seedMissionInterruptors();
    await seedMissionTextGenerator();
    await seedScavengeList();
    await seedCrewGenerate();
    await seedAsteroidsFromAsset();
  }

  Future<void> seedGameData() async {
    final existing = await (db.select(db.gameData)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.into(db.gameData).insert(
            GameDataCompanion.insert(
              gameTurn: const Value(1),
              updatedAt: Value(DateTime.now()),
            ),
          );
    }
  }

  Future<void> seedShipModels() async {
    final existing = await (db.select(db.shipModels)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.batch((batch) {
        batch.insertAll(
          db.shipModels,
          shipModelsSeedData.map((s) {
            return ShipModelsCompanion.insert(
              milCiv: Value(s['milCiv'] as String?),
              mfg: Value(s['mfg'] as String?),
              shipClass: Value(s['shipClass'] as String?),
              size: Value(s['size'] as int? ?? 1),
              model: s['model'] as String,
              weap: Value(s['weap'] as int? ?? 0),
              armor: Value(s['armor'] as int? ?? 0),
              bays: Value(s['bays'] as int? ?? 0),
              cargo: Value(s['cargo'] as int? ?? 0),
              engines: Value(s['engines'] as int? ?? 0),
              maneuv: Value(s['maneuv'] as int? ?? 0),
              weapCtrl: Value(s['weapCtrl'] as int? ?? 0),
              cloak: Value(s['cloak'] as int? ?? 0),
              lifeSupp: Value(s['lifeSupp'] as int? ?? 0),
              maxCargo: Value(s['maxCargo'] as int? ?? 0),
              maxEngines: Value(s['maxEngines'] as int? ?? 0),
              maxManeuv: Value(s['maxManeuv'] as int? ?? 0),
              maxWeapCtrl: Value(s['maxWeapCtrl'] as int? ?? 0),
              maxLifeSupp: Value(s['maxLifeSupp'] as int? ?? 0),
              hp: Value(s['hp'] as int? ?? 100),
              maxHp: Value(s['maxHp'] as int? ?? 100),
              baseValue: Value(s['baseValue'] as int? ?? 500000),
            );
          }),
        );
      });
    }
  }

  Future<void> seedShipModsAvailable() async {
    final existing = await (db.select(db.shipModsAvailable)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.batch((batch) {
        batch.insertAll(
          db.shipModsAvailable,
          shipModsAvailableSeedData.map((m) {
            return ShipModsAvailableCompanion.insert(
              modType: Value(m['modType'] as String?),
              modName: m['modName'] as String,
              price: Value(m['price'] as int? ?? 0),
              power: Value(m['power'] as int? ?? 0),
            );
          }),
        );
      });
    }
  }

  Future<void> seedMissionInterruptors() async {
    final existing = await (db.select(db.missionInterruptors)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.batch((batch) {
        batch.insertAll(
          db.missionInterruptors,
          missionInterruptorsSeedData.map((i) {
            return MissionInterruptorsCompanion.insert(
              type: Value(i['type'] as String?),
              distance: Value((i['distance'] as num?)?.toDouble()),
              cr: Value(i['cr'] as int? ?? 1),
              openingText: Value(i['openingText'] as String?),
              textContent: Value(i['textContent'] as String?),
              resultFail: Value(i['resultFail'] as String?),
              resultPass: Value(i['resultPass'] as String?),
            );
          }),
        );
      });
    }
  }

  Future<void> seedMissionTextGenerator() async {
    final existing = await (db.select(db.missionTextGenerator)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.batch((batch) {
        batch.insertAll(
          db.missionTextGenerator,
          missionTextGeneratorSeedData.map((t) {
            return MissionTextGeneratorCompanion.insert(
              innerStation: Value(t['innerStation'] as String?),
              outerStation: Value(t['outerStation'] as String?),
              scienceStation: Value(t['scienceStation'] as String?),
              corpOrig: Value(t['corpOrig'] as String?),
              corpStyle: Value(t['corpStyle'] as String?),
            );
          }),
        );
      });
    }
  }

  Future<void> seedScavengeList() async {
    final existing = await (db.select(db.scavengeList)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.batch((batch) {
        batch.insertAll(
          db.scavengeList,
          scavengeListSeedData.map((s) {
            return ScavengeListCompanion.insert(
              houseNumber: Value(s['houseNumber'] as String?),
              houseItem: Value(s['houseItem'] as String?),
              rawNumber: Value(s['rawNumber'] as String?),
              rawLength: Value(s['rawLength'] as String?),
              rawItem: Value(s['rawItem'] as String?),
            );
          }),
        );
      });
    }
  }

  Future<void> seedCrewGenerate() async {
    final existing = await (db.select(db.crewGenerate)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await db.batch((batch) {
        batch.insertAll(
          db.crewGenerate,
          crewGenerateSeedData.map((c) {
            return CrewGenerateCompanion.insert(
              forename: Value(c['forename'] as String?),
              surname: Value(c['surname'] as String?),
              gender: Value(c['gender'] as String?),
              nationality: Value(c['nationality'] as String?),
            );
          }),
        );
      });
    }
  }

  Future<void> seedAsteroidsFromAsset() async {
    final existing = await (db.select(db.asteroids)..limit(1)).getSingleOrNull();
    if (existing != null) return;

    try {
      final jsonStr = await rootBundle.loadString('assets/data/asteroids.json');
      final List<dynamic> list = jsonDecode(jsonStr);

      await db.batch((batch) {
        batch.insertAll(
          db.asteroids,
          list.map((a) {
            return AsteroidsCompanion.insert(
              asteroidName: a['asteroidName'] as String,
              m3: Value(a['m3'] as int? ?? 0),
              surfaceM: Value(a['surfaceM'] as int? ?? 0),
              zeroGM: Value(a['zeroGM'] as int? ?? 0),
              conductiveM: Value(a['conductiveM'] as int? ?? 0),
              lifeSuppG: Value(a['lifeSuppG'] as int? ?? 0),
              fuelG: Value(a['fuelG'] as int? ?? 0),
              ove: Value(a['ove'] as int? ?? 0),
              waterIce: Value(a['waterIce'] as int? ?? 0),
            );
          }),
        );
      });
    } catch (_) {
      // Fallback sample asteroids for pure unit tests without asset bundle
      final sampleAsteroids = [
        AsteroidsCompanion.insert(
          asteroidName: '433 Eros',
          m3: const Value(120),
          surfaceM: const Value(40),
          zeroGM: const Value(20),
          conductiveM: const Value(30),
          lifeSuppG: const Value(10),
          fuelG: const Value(5),
          ove: const Value(2),
          waterIce: const Value(13),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '101955 Bennu',
          m3: const Value(180),
          surfaceM: const Value(60),
          zeroGM: const Value(40),
          conductiveM: const Value(35),
          lifeSuppG: const Value(15),
          fuelG: const Value(10),
          ove: const Value(4),
          waterIce: const Value(16),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '162173 Ryugu',
          m3: const Value(350),
          surfaceM: const Value(110),
          zeroGM: const Value(90),
          conductiveM: const Value(65),
          lifeSuppG: const Value(25),
          fuelG: const Value(20),
          ove: const Value(10),
          waterIce: const Value(30),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '243 Ida',
          m3: const Value(500),
          surfaceM: const Value(150),
          zeroGM: const Value(130),
          conductiveM: const Value(95),
          lifeSuppG: const Value(40),
          fuelG: const Value(30),
          ove: const Value(15),
          waterIce: const Value(40),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '253 Mathilde',
          m3: const Value(750),
          surfaceM: const Value(220),
          zeroGM: const Value(180),
          conductiveM: const Value(140),
          lifeSuppG: const Value(60),
          fuelG: const Value(45),
          ove: const Value(25),
          waterIce: const Value(80),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '951 Gaspra',
          m3: const Value(150),
          surfaceM: const Value(50),
          zeroGM: const Value(30),
          conductiveM: const Value(35),
          lifeSuppG: const Value(12),
          fuelG: const Value(8),
          ove: const Value(3),
          waterIce: const Value(12),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '4 Vesta Fragment A',
          m3: const Value(600),
          surfaceM: const Value(180),
          zeroGM: const Value(140),
          conductiveM: const Value(120),
          lifeSuppG: const Value(50),
          fuelG: const Value(30),
          ove: const Value(20),
          waterIce: const Value(60),
        ),
        AsteroidsCompanion.insert(
          asteroidName: '1 Ceres Outlier',
          m3: const Value(800),
          surfaceM: const Value(240),
          zeroGM: const Value(190),
          conductiveM: const Value(160),
          lifeSuppG: const Value(70),
          fuelG: const Value(50),
          ove: const Value(30),
          waterIce: const Value(60),
        ),
      ];

      await db.batch((batch) {
        batch.insertAll(db.asteroids, sampleAsteroids);
      });
    }
  }
}

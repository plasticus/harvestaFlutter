import 'dart:math';
import 'package:drift/drift.dart';
import '../../data/app_database.dart';
import 'combat_models.dart';
import 'combat_engine.dart';

class CombatService {
  final AppDatabase db;
  final Random rng;

  CombatService(this.db, {Random? customRng}) : rng = customRng ?? Random();

  /// Loads fleet ships, fitted modules, bridge crew, and quirks to construct combat participants
  Future<List<CombatParticipant>> buildParticipantsFromSquadron(String corpName, String squadronName) async {
    final ships = await db.fleetDao.getSquadronShips(corpName, squadronName);
    final participants = <CombatParticipant>[];

    for (final s in ships) {
      // Weapons and Armor
      final mods = await db.fleetDao.getShipMods(s.shipName);
      final weaponMods = mods.where((m) => m.modType == 'Weapon').toList();
      final armorMod = mods.where((m) => m.modType == 'Armor').firstOrNull;

      final weapons = <CombatWeapon>[];
      for (final w in weaponMods) {
        weapons.add(
          CombatWeapon(
            name: w.modName ?? 'Kinetic Battery',
            power: w.power,
          ),
        );
      }
      if (weapons.isEmpty) {
        weapons.add(CombatWeapon.standardKinetic());
      }

      CombatArmor armor;
      if (armorMod != null) {
        armor = CombatArmor(name: armorMod.modName ?? 'Armor Plating', power: armorMod.power);
      } else {
        armor = CombatArmor.standardPlating();
      }

      // Crew Officers
      final officers = await (db.select(db.crew)
            ..where((c) =>
                c.corpName.equals(corpName) &
                c.shipName.equals(s.shipName) &
                c.assignment.isIn(['Captain', 'Pilot', 'First Officer', 'Second Officer'])))
          .get();

      final combatOfficers = officers
          .map((o) => CombatOfficer(
                id: o.id,
                name: o.name,
                role: o.assignment,
                leadership: o.leadership,
                influence: o.influence,
                pilot: o.pilot,
                computation: o.computation,
                repair: o.repair,
                shipWeapons: o.shipWeapons,
                fighting: o.fighting,
              ))
          .toList();

      // Quirks
      final quirks = await db.fleetDao.getShipPersonalities(s.shipName);
      final quirkNames = quirks.map((q) => q.personality).where((pName) => pName.isNotEmpty).toList();

      participants.add(
        CombatParticipant(
          corpName: corpName,
          squadron: squadronName,
          shipName: s.shipName,
          shipClass: s.shipClass ?? 'Civilian',
          shipModel: s.shipModel ?? 'Standard Hull',
          shipSize: s.shipSize,
          baseValue: s.value,
          hp: s.hp,
          maxHp: s.maxHp,
          cargo: s.cargo,
          maxCargo: s.maxCargo,
          engines: s.engines,
          maxEngines: s.maxEngines,
          maneuv: s.maneuv,
          maxManeuv: s.maxManeuv,
          weapCtrl: s.weapCtrl,
          maxWeapCtrl: s.maxWeapCtrl,
          lifeSupp: s.lifeSupp,
          maxLifeSupp: s.maxLifeSupp,
          weapons: weapons,
          armor: armor,
          officers: combatOfficers,
          quirks: quirkNames,
        ),
      );
    }

    return participants;
  }

  /// Generates a procedural enemy battle group for combat testing and mission encounters
  List<CombatParticipant> buildHostileEnemySquadron({
    required String enemyCorpName,
    required String enemySquadronName,
    required int threatIndex, // 1 to 5
  }) {
    final list = <CombatParticipant>[];
    final numShips = (threatIndex + 1).clamp(1, 4);

    for (var i = 0; i < numShips; i++) {
      final isLeader = i == 0;
      final name = isLeader ? '$enemySquadronName Flagship' : '$enemySquadronName Raider ${i + 1}';
      final baseHp = 70 + (threatIndex * 20);
      final weaponPower = 35 + (threatIndex * 15);

      list.add(
        CombatParticipant(
          corpName: enemyCorpName,
          squadron: enemySquadronName,
          shipName: name,
          shipClass: isLeader ? 'Destroyer' : 'Corvette',
          shipModel: isLeader ? 'Vulture Heavy Gunship' : 'Kestrel Light Raider',
          shipSize: isLeader ? 2 : 1,
          baseValue: 450000 * threatIndex,
          hp: baseHp,
          maxHp: baseHp,
          cargo: 20,
          maxCargo: 20,
          engines: 70 + (threatIndex * 5),
          maxEngines: 70 + (threatIndex * 5),
          maneuv: 65 + (threatIndex * 5),
          maxManeuv: 65 + (threatIndex * 5),
          weapCtrl: 45 + (threatIndex * 10),
          maxWeapCtrl: 45 + (threatIndex * 10),
          lifeSupp: 50,
          maxLifeSupp: 50,
          weapons: [
            CombatWeapon(
              name: isLeader ? 'Heavy Dual Railguns' : 'Kinetic Autocannons',
              power: weaponPower,
            ),
          ],
          armor: CombatArmor(
            name: 'Plasteel Plating',
            power: 25 + (threatIndex * 10),
          ),
          officers: [
            CombatOfficer(
              id: -1,
              name: 'Pirate Captain',
              role: 'Captain',
              leadership: 40 + (threatIndex * 8),
              shipWeapons: 45 + (threatIndex * 8),
              pilot: 45 + (threatIndex * 8),
            ),
          ],
        ),
      );
    }

    return list;
  }

  /// Commits combat results to Drift tables (Fleet subsystem HP, Salvage wreckage, and Crew skill promotions)
  Future<void> commitCombatResults({
    required String playerCorp,
    required CombatResult result,
  }) async {
    // 1. Update fleet health
    for (final p in result.allParticipants) {
      if (p.corpName == playerCorp) {
        final ship = await db.fleetDao.getShipByName(p.shipName);
        if (ship != null) {
          if (p.isDestroyed) {
            // Delete destroyed ship and clear crew assignments
            await (db.delete(db.fleet)..where((f) => f.shipName.equals(p.shipName))).go();
            await (db.delete(db.shipMods)..where((m) => m.shipName.equals(p.shipName))).go();
            await (db.delete(db.shipPersonalities)..where((sp) => sp.shipName.equals(p.shipName))).go();
            await (db.update(db.crew)..where((c) => c.corpName.equals(playerCorp) & c.shipName.equals(p.shipName))).write(
              const CrewCompanion(
                shipName: Value(''),
                assignment: Value('Unassigned'),
                squadron: Value(''),
              ),
            );
          } else {
            // Update surviving subsystem status
            await (db.update(db.fleet)..where((f) => f.shipName.equals(p.shipName))).write(
              FleetCompanion(
                hp: Value(max(0, p.hp)),
                cargo: Value(max(0, p.cargo)),
                engines: Value(max(0, p.engines)),
                maneuv: Value(max(0, p.maneuv)),
                weapCtrl: Value(max(0, p.weapCtrl)),
                lifeSupp: Value(max(0, p.lifeSupp)),
              ),
            );
          }
        }
      }
    }

    // 2. Insert salvage records
    for (final s in result.salvageWreckages) {
      await db.into(db.salvage).insert(
            SalvageCompanion.insert(
              salvageName: s.salvageName,
              corpName: playerCorp,
              m3: Value(s.totalVolume),
              surfaceM: Value(s.surfaceMetals),
              zeroGM: Value(s.zeroGMetals),
              conductiveM: Value(s.conductiveMetals),
              lifeSuppG: Value(s.lifeSupportGases),
              fuelG: Value(s.fuelGases),
              ove: Value(s.otherValuableElements),
              waterIce: Value(s.waterIce),
            ),
          );
    }

    // 3. Promote officer skills
    for (final entry in result.officerPromotions.entries) {
      final officerId = entry.key;
      final promotions = entry.value;

      final officer = await (db.select(db.crew)..where((c) => c.id.equals(officerId))).getSingleOrNull();
      if (officer != null) {
        for (final promo in promotions) {
          if (promo.contains('ShipWeapons')) {
            await (db.update(db.crew)..where((c) => c.id.equals(officerId))).write(
              CrewCompanion(shipWeapons: Value(officer.shipWeapons + 1)),
            );
          } else if (promo.contains('Pilot')) {
            await (db.update(db.crew)..where((c) => c.id.equals(officerId))).write(
              CrewCompanion(pilot: Value(officer.pilot + 1)),
            );
          } else if (promo.contains('Repair')) {
            await (db.update(db.crew)..where((c) => c.id.equals(officerId))).write(
              CrewCompanion(repair: Value(officer.repair + 1)),
            );
          } else if (promo.contains('Leadership')) {
            await (db.update(db.crew)..where((c) => c.id.equals(officerId))).write(
              CrewCompanion(leadership: Value(officer.leadership + 1)),
            );
          }
        }
      }
    }
  }

  /// High-level orchestration method to run combat simulation between two squadrons
  Future<CombatResult> executeTacticalBattle({
    required String corpA,
    required String squadronA,
    required String corpB,
    required String squadronB,
    TacticalTactic tacticA = TacticalTactic.focusWeak,
    TacticalTactic tacticB = TacticalTactic.focusWeak,
  }) async {
    final teamA = await buildParticipantsFromSquadron(corpA, squadronA);
    final teamB = await buildParticipantsFromSquadron(corpB, squadronB);

    final engine = CombatEngine(
      teamA: teamA,
      teamB: teamB,
      squadronA: squadronA,
      squadronB: squadronB,
      corpNameA: corpA,
      corpNameB: corpB,
      tacticA: tacticA,
      tacticB: tacticB,
      customRng: rng,
    );

    final result = engine.simulateFullBattle();
    await commitCombatResults(playerCorp: corpA, result: result);
    return result;
  }
}

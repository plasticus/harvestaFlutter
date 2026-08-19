import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/crew_table.dart';
import '../tables/cadets_table.dart';
import '../tables/cadets_progress_table.dart';

part 'crew_dao.g.dart';

@DriftAccessor(tables: [Crew, Cadets, CadetsProgress])
class CrewDao extends DatabaseAccessor<AppDatabase> with _$CrewDaoMixin {
  CrewDao(super.db);

  Future<List<CrewMember>> getCorpCrew(String corpName) =>
      (select(crew)..where((t) => t.corpName.equals(corpName))).get();

  Future<List<CrewMember>> getShipCrew(String shipName) =>
      (select(crew)..where((t) => t.shipName.equals(shipName))).get();

  Future<List<Cadet>> getAvailableCadets() =>
      (select(cadets)..where((t) => t.status.equals('Available'))).get();

  Future<int> hireCadet(int cadetId, String corpName) async {
    final cadet = await (select(cadets)..where((t) => t.id.equals(cadetId))).getSingleOrNull();
    if (cadet == null) return -1;

    await (update(cadets)..where((t) => t.id.equals(cadetId)))
        .write(const CadetsCompanion(status: Value('Hired')));

    return into(crew).insert(CrewCompanion.insert(
      corpName: Value(corpName),
      assignment: const Value('Unassigned'),
      status: const Value('Active'),
      name: cadet.name,
      leadership: Value(cadet.leadership),
      influence: Value(cadet.influence),
      pilot: Value(cadet.pilot),
      computation: Value(cadet.computation),
      repair: Value(cadet.repair),
      shipWeapons: Value(cadet.shipWeapons),
      fighting: Value(cadet.firearms),
      athletics: Value(cadet.athletics),
    ));
  }
}

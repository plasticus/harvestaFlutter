import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/game_data_table.dart';

part 'game_data_dao.g.dart';

@DriftAccessor(tables: [GameData])
class GameDataDao extends DatabaseAccessor<AppDatabase> with _$GameDataDaoMixin {
  GameDataDao(super.db);

  Future<int> getTurn() async {
    final entry = await (select(gameData)..limit(1)).getSingleOrNull();
    return entry?.gameTurn ?? 1;
  }

  Future<void> setTurn(int turn) async {
    final existing = await (select(gameData)..limit(1)).getSingleOrNull();
    if (existing == null) {
      await into(gameData).insert(GameDataCompanion.insert(gameTurn: Value(turn)));
    } else {
      await (update(gameData)..where((t) => t.id.equals(existing.id)))
          .write(GameDataCompanion(gameTurn: Value(turn), updatedAt: Value(DateTime.now())));
    }
  }

  Future<int> advanceTurn() async {
    final current = await getTurn();
    final next = current + 1;
    await setTurn(next);
    return next;
  }
}

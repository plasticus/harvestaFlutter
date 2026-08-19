import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/corp_inventory_table.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [CorpInventory])
class InventoryDao extends DatabaseAccessor<AppDatabase> with _$InventoryDaoMixin {
  InventoryDao(super.db);

  Future<List<CorpInventoryItem>> getCorpInventory(String corpName) =>
      (select(corpInventory)..where((t) => t.corpName.equals(corpName))).get();

  Future<int> getItemQuantity(String corpName, String item) async {
    final row = await (select(corpInventory)
      ..where((t) => t.corpName.equals(corpName) & t.item.equals(item))).getSingleOrNull();
    return row?.qty ?? 0;
  }

  Future<void> setItemQuantity(String corpName, String item, int qty) async {
    final existing = await (select(corpInventory)
      ..where((t) => t.corpName.equals(corpName) & t.item.equals(item))).getSingleOrNull();
    if (existing == null) {
      await into(corpInventory).insert(CorpInventoryCompanion.insert(
        corpName: corpName,
        item: item,
        qty: Value(qty),
      ));
    } else {
      await (update(corpInventory)..where((t) => t.id.equals(existing.id)))
          .write(CorpInventoryCompanion(qty: Value(qty)));
    }
  }

  Future<void> adjustItemQuantity(String corpName, String item, int delta) async {
    final current = await getItemQuantity(corpName, item);
    await setItemQuantity(corpName, item, current + delta);
  }
}

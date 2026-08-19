import 'package:drift/drift.dart';

@DataClassName('CorpInventoryItem')
class CorpInventory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get corpName => text().withLength(min: 0, max: 65)();
  TextColumn get item => text().withLength(min: 0, max: 50)();
  IntColumn get qty => integer().withDefault(const Constant(0))();
}

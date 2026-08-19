import 'package:drift/drift.dart';

@DataClassName('MissionTextGeneratorEntry')
class MissionTextGenerator extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get innerStation => text().nullable()();
  TextColumn get outerStation => text().nullable()();
  TextColumn get scienceStation => text().nullable()();
  TextColumn get corpOrig => text().nullable()();
  TextColumn get corpStyle => text().nullable()();
}

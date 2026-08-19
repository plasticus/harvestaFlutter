import 'package:drift/drift.dart';

@DataClassName('ScavengeListEntry')
class ScavengeList extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get houseNumber => text().nullable()();
  TextColumn get houseItem => text().nullable()();
  TextColumn get rawNumber => text().nullable()();
  TextColumn get rawLength => text().nullable()();
  TextColumn get rawItem => text().nullable()();
}

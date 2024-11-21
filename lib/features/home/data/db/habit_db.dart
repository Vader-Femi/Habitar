import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart' as driftFlutter;
import 'package:habitar/features/home/data/db/string_list_type_converter.dart';
import 'habit_table.dart';

part 'habit_db.g.dart';

@DriftDatabase(tables: [HabitTable])
class HabitDb extends _$HabitDb {
  HabitDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftFlutter.driftDatabase(name: 'habit_db');
  }
}

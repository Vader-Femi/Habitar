import 'package:drift/drift.dart';
import 'package:habitar/features/home/data/db/string_list_type_converter.dart';

class HabitTable extends Table {
  TextColumn get habit => text()();
  TextColumn get selectedPeriodicity => text().map(StringListTypeConverter())();
  TextColumn get selectedTimeOfDay => text().map(StringListTypeConverter())();
  TextColumn get streak => text()();
  TextColumn get lastDateTicked => text()();

  @override
  Set<Column> get primaryKey => {habit};

}

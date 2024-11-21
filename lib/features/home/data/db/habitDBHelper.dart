import 'package:drift/drift.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import 'package:habitar/features/home/data/models/updateAHabitReqModel.dart';
import '../../../../service_locator.dart';
import 'habit_db.dart';

class HabitDBHelper {

  final HabitDb _habitDB;
  const HabitDBHelper(this._habitDB);

  Future<void> addHabit(HabitModel entry) {
    return _habitDB
        .into(_habitDB.habitTable)
        .insert(entry.toHabitTableCompanion());
  }

  Future<void> insertMultipleHabits(List<HabitModel> entries) async {
    await _habitDB.batch((batch) {
      batch.insertAll(
        _habitDB.habitTable,
        entries.map((habit) => habit.toHabitTableCompanion()),
      );
    });
  }

  Future updateHabit(UpdateAHabitReqModel entry) {
    return (_habitDB.update(_habitDB.habitTable)
          ..where(
            (tbl) => tbl.habit.equals(entry.oldId),
          ))
        .write(
      HabitTableCompanion(
        habit: Value(entry.newHabit.habit),
        selectedPeriodicity: Value(entry.newHabit.selectedPeriodicity),
        selectedTimeOfDay: Value(entry.newHabit.selectedTimeOfDay),
        streak: Value(entry.newHabit.streak),
        lastDateTicked: Value(entry.newHabit.lastDateTicked),
      ),
    );
  }

  Future deleteHabits(HabitModel entry) {
    return (_habitDB.delete(_habitDB.habitTable)
          ..where((tbl) => tbl.habit.equals(entry.habit)))
        .go();
  }

  Future<List<HabitModel>> getHabitsAlphabetically() async {
    var habitTableData = await (_habitDB.select(_habitDB.habitTable)
          ..orderBy([(t) => OrderingTerm(expression: t.habit)]))
        .get();

    return habitTableData.map((habit) => HabitModel.fromHabitTableData(habit) ).toList();

  }
}

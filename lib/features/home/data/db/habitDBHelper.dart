import 'package:drift/drift.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import 'package:habitar/features/home/data/models/updateAHabitReqModel.dart';
import 'habit_db.dart';

class HabitDBHelper {
  final HabitDb _habitDB;

  const HabitDBHelper(this._habitDB);

  Future<void> addHabit(HabitModel entry) {
    return _habitDB.into(_habitDB.habitTable).insert(
          entry.toHabitTableCompanion(),
        );
  }

  Future<void> insertMultipleHabits(List<HabitModel> entries) async {
    await _habitDB.batch((batch) {
      batch.insertAll(
        _habitDB.habitTable,
        entries.map((habit) => habit.toHabitTableCompanion()),
      );
    });
  }

  Future<void> updateHabit(UpdateAHabitReqModel updateAHabitReqModel) {
    return (_habitDB.update(_habitDB.habitTable)
          ..where(
            (tbl) => tbl.habit.equals(updateAHabitReqModel.oldId),
          ))
        .write(
      HabitTableCompanion(
        habit: Value(updateAHabitReqModel.newHabit.habit),
        selectedPeriodicity:
            Value(updateAHabitReqModel.newHabit.selectedPeriodicity),
        selectedTimeOfDay:
            Value(updateAHabitReqModel.newHabit.selectedTimeOfDay),
        streak: Value(updateAHabitReqModel.newHabit.streak),
        lastDateTicked: Value(updateAHabitReqModel.newHabit.lastDateTicked),
      ),
    );
  }

  Future deleteHabits(HabitModel entry) {
    return (_habitDB.delete(_habitDB.habitTable)
          ..where((tbl) => tbl.habit.equals(entry.habit)))
        .go();
  }

  Future deleteAllHabits() {
    return _habitDB.delete(_habitDB.habitTable).go();
  }

  Future<HabitModel?> getSingleHabit(String habit) async {
    var habitTableData = await (_habitDB.select(_habitDB.habitTable)
          ..where((habitItem) => habitItem.habit.equals(habit)))
        .getSingleOrNull();

    if (habitTableData != null) {
      return HabitModel.fromHabitTableData(habitTableData);
    } else {
      return null;
    }
  }

  Future<List<HabitModel>> getHabitsAlphabetically() async {
    var habitTableData = await (_habitDB.select(_habitDB.habitTable)
          ..orderBy([(t) => OrderingTerm(expression: t.habit)]))
        .get();

    return habitTableData
        .map((habit) => HabitModel.fromHabitTableData(habit))
        .toList();
  }

  Stream<List<HabitTableData>> watchHabitsAlphabetically() {
    var habitTableData = (_habitDB.select(_habitDB.habitTable)
          ..orderBy([(t) => OrderingTerm(expression: t.habit)]))
        .watch();

    return habitTableData;
  }
}

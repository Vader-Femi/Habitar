import 'package:collection/collection.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/common/helpers/week_names.dart';
import 'package:habitar/features/home/domain/usecases/tick_habits.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/usecases/add_habits_batch_to_db.dart';
import '../../domain/usecases/delete_all_habits_in_db.dart';
import '../../domain/usecases/get_habit_from_db.dart';
import '../../domain/usecases/get_habits.dart';

TodayHabitsViewModel get todayHabitsViewModel =>
    Super.init(TodayHabitsViewModel());

class TodayHabitsViewModel {
  var habits = <TodayHabitEntity>[].rx;

  Future<DataState> getTodayHabits() async {
    var result = await sl<GetHabitsUseCase>().call();
    var habitsFromDb = await sl<GetHabitsFromDBUseCase>().call();

    if (result is DataSuccess) {
        sl<DeleteAllHabitsInDBUseCase>().call();
        sl<AddHabitsBatchToDBUseCase>().call(params: result.data);
        habits.clear();

        final todayWeekdayInStringLong = (weekNames
            .firstWhere(
                (element) => element.positionInWeek == DateTime.now().weekday)
            .longName);

        for (var habitModel in result.data) {
          var habit = TodayHabitEntity.fromModel(habitModel);
          if (habit.habit.selectedPeriodicity
              .contains(todayWeekdayInStringLong)) {
            habits.add(habit);
          }
      }
    } else if (result is DataFailed) {
      final todayWeekdayInStringLong = (weekNames
          .firstWhere(
              (element) => element.positionInWeek == DateTime.now().weekday)
          .longName);
      habits.clear();
      for (var habitModel in habitsFromDb) {
        var habit = TodayHabitEntity.fromModel(habitModel);
        if (habit.habit.selectedPeriodicity
            .contains(todayWeekdayInStringLong)) {
          habits.add(habit);
        }
      }
    }

    return result;
  }

  Future<DataState> tickHabit({
    required TodayHabitEntity habit,
    required int index,
    required bool isTicked,
  }) async {
    var result = await sl<TickHabitsUseCase>()
        .call(params: habit.copyWith(isSelected: isTicked));

    if (result is DataSuccess) {
      habits.remove(habit);
      habits.insert(index, habit.copyWith(isSelected: isTicked));
    }

    return result;
  }
}

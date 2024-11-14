import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/common/helpers/week_names.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/usecases/tick_habits.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/usecases/get_habits.dart';

GetHabitsViewModel get getHabitsViewModel => Super.init(GetHabitsViewModel());

class GetHabitsViewModel {
  // var habits = <HabitEntity>[].rx;

  // Future<DataState> getHabits() async {
  //   var result = await sl<GetHabitsUseCase>().call();
  //   if (result is DataSuccess){
  //     habits.clear();
  //     for (var habitModel in result.data) {
  //       habits.add(HabitEntity.fromModel(habitModel));
  //     }
  //   }
  //   return result;
  // }

  var habits = <TodayHabitEntity>[].rx;

  Future<DataState> getHabits() async {
    var result = await sl<GetHabitsUseCase>().call();

    if (result is DataSuccess) {
      habits.clear();

      final todayWeekdayInString = weekNames.entries
          .firstWhere((element) => element.value == DateTime.now().weekday)
          .key;

      for (var habitModel in result.data) {
        var habit = TodayHabitEntity.fromModel(habitModel);
        if (habit.selectedPeriodicity.contains(todayWeekdayInString)) {
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
    var result = await sl<TickHabitsUseCase>().call(params: isTicked);

    if (result is DataSuccess) {
      habits.remove(habit);
      habits.insert(index, habit.copyWith(isSelected: isTicked));
    }

    return result;
  }
}

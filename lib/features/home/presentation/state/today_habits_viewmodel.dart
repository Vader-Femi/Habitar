import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/usecases/tick_habits.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/usecases/get_habits.dart';

TodayHabitsViewModel get todayHabitsViewModel =>
    Super.init(TodayHabitsViewModel());

class TodayHabitsViewModel {

  Future<DataState> getTodayHabits() async {
    return await sl<GetHabitsUseCase>().call();
  }

  Future<DataState> tickHabit({
    required TodayHabitEntity habit,
    required bool isTicked,
  }) async {
    var result = await sl<TickHabitsUseCase>()
        .call(params: habit.copyWith(isSelected: isTicked));
    return result;
  }
}

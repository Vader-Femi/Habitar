import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/user.dart';
import 'package:habitar/features/home/domain/usecases/get_user.dart';
import '../../../../common/helpers/week_names.dart';
import '../../../../service_locator.dart';
import '../../data/models/HabitModel.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/usecases/watch_habit_from_db.dart';

HomeViewModel get getHomeViewModel => Super.init(HomeViewModel());

class HomeViewModel {
  var selectedTabIndex = 0.rx;

  var user = UserEntity(
    username: "",
    email: "",
    habitsCompleted: "-1",
  ).rx;

  var habits = <HabitEntity>[].rx;
  var todayHabits = <TodayHabitEntity>[].rx;

  Future<void> setListener() async {
    var habitsFromDb = await sl<WatchHabitsFromDBUseCase>().call();

    habitsFromDb.listen((habitTableData) {
      habits.clear();
      todayHabits.clear();
      habitTableData
          .map((habit) => HabitModel.fromHabitTableData(habit))
          .toList()
          .forEach((habit) => habits.add(HabitEntity.fromModel(habit)));

      final todayWeekdayInStringLong = (weekNames
          .firstWhere(
              (element) => element.positionInWeek == DateTime.now().weekday)
          .longName);

      for (var habitTable in habitTableData) {
        var todayHabit = TodayHabitEntity.fromHabitTableData(habitTable);
        if (todayHabit.habit.selectedPeriodicity.contains(todayWeekdayInStringLong)) {
          todayHabits.add(todayHabit);
        }
      }
    });
  }

  void selectTabAtIndex(int index) => selectedTabIndex.state = index;

  Future<void> getUser() async {
    // user = (await sl<GetUserUseCase>().call()).rx;
    var result = await sl<GetUserUseCase>().call();


    user = UserEntity(
      username: result.username,
      email: result.email,
      habitsCompleted: result.habitsCompleted,
    ).rx;
  }
}

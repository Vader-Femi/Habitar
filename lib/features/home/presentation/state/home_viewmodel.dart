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

  final user = RxT<UserEntity>(
    UserEntity(
      username: "",
      email: "",
      habitsCompleted: "-1",
    ),
  );

  final habits = <HabitEntity>[].rx;
  final todayHabits = <TodayHabitEntity>[].rx;

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
        if (todayHabit.habit.selectedPeriodicity
            .contains(todayWeekdayInStringLong)) {
          todayHabits.add(todayHabit);
        }
      }
    });
  }

  void selectTabAtIndex(int index) => selectedTabIndex.state = index;

  Future<void> getUser() async {
    user.state = (await sl<GetUserUseCase>().call());
  }
}

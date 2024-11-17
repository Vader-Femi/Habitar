import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/usecases/tick_habits.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/get_user.dart';

ProfileViewModel get getProfileViewModel =>
    Super.init(ProfileViewModel());

class ProfileViewModel {

  var habits = <HabitEntity>[].rx;

  Future<DataState> getHabits() async {
    var result = await sl<GetHabitsUseCase>().call();

    if (result is DataSuccess) {
      habits.clear();
      for (var habitModel in result.data) {
        habits.add(HabitEntity.fromModel(habitModel));
      }
    }

    return result;
  }
  
  Future<DataState> logOut() async {
    return DataFailed();
  }
  
  Future<DataState> deleteAccount() async {
    return DataFailed();
  }
}

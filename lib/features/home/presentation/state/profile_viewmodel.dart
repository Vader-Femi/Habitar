import 'package:collection/collection.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/usecases/get_habit_from_db.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/add_habits_batch_to_db.dart';
import '../../domain/usecases/delete_all_habits_in_db.dart';
import '../../domain/usecases/get_habits.dart';

ProfileViewModel get getProfileViewModel => Super.init(ProfileViewModel());

class ProfileViewModel {
  var habits = <HabitEntity>[].rx;

  Future<DataState> getHabits() async {
    var result = await sl<GetHabitsUseCase>().call();
    var habitsFromDb = await sl<GetHabitsFromDBUseCase>().call();

    if (result is DataSuccess) {
      sl<DeleteAllHabitsInDBUseCase>().call();
      sl<AddHabitsBatchToDBUseCase>().call(params: result.data);
      habits.clear();

      for (var habit in result.data) {
        habits.add(HabitEntity.fromModel(habit));
      }

    } else if (result is DataFailed) {
      habits.clear();
      for (var habit in habitsFromDb) {
        habits.add(HabitEntity.fromModel(habit));
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

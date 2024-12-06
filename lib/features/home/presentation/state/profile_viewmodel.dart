import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/usecases/get_habit_from_db.dart';
import 'package:habitar/features/home/domain/usecases/watch_habit_from_db.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../data/models/HabitModel.dart';
import '../../domain/usecases/get_habits.dart';

ProfileViewModel get getProfileViewModel => Super.init(ProfileViewModel());

class ProfileViewModel {

  Future<DataState> getHabits() async {
    return await sl<GetHabitsUseCase>().call();
  }

  Future<DataState> logOut() async {
    return DataFailed();
  }

  Future<DataState> deleteAccount() async {
    return DataFailed();
  }
}

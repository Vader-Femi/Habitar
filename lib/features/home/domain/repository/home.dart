import 'package:habitar/features/home/domain/entities/user.dart';
import '../../../../core/res/data_state.dart';
import '../entities/add_a_habit_req_entity.dart';
import '../entities/today_habit_entity.dart';

abstract class HomeRepository {

  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);
  Future<DataState> getHabits();
  Future<DataState> tickHabit(TodayHabitEntity todayHabitEntity);
  Future<UserEntity> getUser();
}
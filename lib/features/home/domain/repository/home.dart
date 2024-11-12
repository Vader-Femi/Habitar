import '../../../../core/res/data_state.dart';
import '../entities/add_a_habit_req_entity.dart';

abstract class HomeRepository {

  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);
  Future<DataState> getHabits();
}
import '../../../../core/res/data_state.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';

abstract class HomeService {
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq);
}


class HomeServiceImpl extends HomeService {

  @override
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq) {
    // TODO: implement addAHabit
    throw UnimplementedError();
  }
}

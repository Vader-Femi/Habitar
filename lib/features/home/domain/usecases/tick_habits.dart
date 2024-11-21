import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/repository/auth.dart';

class TickHabitsUseCase implements Usecase<DataState,TodayHabitEntity> {

  final HomeRepository _homeRepository;
  TickHabitsUseCase(this._homeRepository);

  @override
  Future<DataState> call({TodayHabitEntity? params}) async {
    return _homeRepository.tickHabit(params!);
  }

}
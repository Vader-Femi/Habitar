import 'package:habitar/features/home/domain/entities/update_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateHabitUseCase implements Usecase<DataState,UpdateAHabitReqEntity> {

  final HomeRepository _homeRepository;
  UpdateHabitUseCase(this._homeRepository);

  @override
  Future<DataState> call({UpdateAHabitReqEntity? params}) async {
    return _homeRepository.updateHabit(params!);
  }

}
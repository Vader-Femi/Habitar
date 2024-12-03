import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class AddAHabitUseCase implements Usecase<DataState,AddAHabitEntity> {

  final HomeRepository _homeRepository;
  AddAHabitUseCase(this._homeRepository);

  @override
  Future<DataState> call({AddAHabitEntity? params}) async {
    return _homeRepository.addAHabit(params!);
  }

}
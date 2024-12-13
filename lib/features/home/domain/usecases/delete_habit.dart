import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class DeleteHabitUseCase implements Usecase<DataState,HabitEntity> {

  final HomeRepository _homeRepository;
  DeleteHabitUseCase(this._homeRepository);

  @override
  Future<DataState> call({HabitEntity? params}) async {
    return _homeRepository.deleteHabit(params!);
  }

}
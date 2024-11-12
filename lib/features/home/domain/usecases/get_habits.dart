import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../auth/domain/repository/auth.dart';

class GetHabitsUseCase implements Usecase<DataState,String> {

  final HomeRepository _homeRepository;
  GetHabitsUseCase(this._homeRepository);

  @override
  Future<DataState> call({String? params}) async {
    return _homeRepository.getHabits();
  }

}
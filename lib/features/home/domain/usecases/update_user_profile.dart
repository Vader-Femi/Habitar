import 'package:habitar/features/home/domain/entities/update_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';

class UpdateUserProfileUseCase implements Usecase<DataState,String> {

  final HomeRepository _homeRepository;
  UpdateUserProfileUseCase(this._homeRepository);

  @override
  Future<DataState> call({String? params}) async {
    return _homeRepository.updateUserProfile(params!);
  }

}
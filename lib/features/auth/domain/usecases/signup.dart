import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/SignUpRequestEntity.dart';
import '../repository/auth.dart';

class SignUpUseCase implements Usecase<DataState,SignUpRequestEntity> {

  final AuthRepository _authRepository;
  SignUpUseCase(this._authRepository);

  @override
  Future<DataState> call({SignUpRequestEntity? params}) async {
    return _authRepository.signUp(params!);
  }

}
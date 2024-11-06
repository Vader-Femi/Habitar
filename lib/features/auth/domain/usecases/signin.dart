import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/SignInRequestEntity.dart';
import '../repository/auth.dart';

class SignInUseCase implements Usecase<DataState,SignInRequestEntity> {

  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  @override
  Future<DataState> call({SignInRequestEntity? params}) async {
    return _authRepository.signIn(params!);
  }

}
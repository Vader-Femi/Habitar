import '../../../../core/res/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/auth.dart';

class SignInUseCase implements Usecase<DataState,String> {


  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  @override
  Future<DataState> call({String? params}) async {
    return _authRepository.signIn(params!);
  }

}
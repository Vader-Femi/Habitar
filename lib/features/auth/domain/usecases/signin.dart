import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';
import '../../../../core/res/data_state.dart';

class SignInUseCase implements Usecase<DataState,String> {


  final AuthRepository _authRepository;
  SignInUseCase(this._authRepository);

  @override
  Future<DataState> call({String? params}) async {
    return _authRepository.signIn(params!);
  }

}
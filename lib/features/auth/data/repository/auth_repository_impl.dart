import '../../../../core/res/data_state.dart';
import '../../domain/entities/SignUpRequestEntity.dart';
import '../../domain/repository/auth.dart';
import '../sources/auth_service.dart';

class AuthRepositoryImpl extends AuthRepository{


  final AuthService _authService;
  AuthRepositoryImpl(this._authService);


  @override
  Future<DataState> signIn(String name) async {
    return await _authService.signIn(name);
  }

  @override
  Future<DataState> signUp(SignUpRequestEntity signUpReq) async {
    return await _authService.signup(signUpReq);
  }

}
import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/auth/data/sources/auth_service.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';
import '../../domain/entities/SignUpRequestEntity.dart';

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
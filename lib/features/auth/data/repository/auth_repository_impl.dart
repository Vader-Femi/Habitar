import 'package:dartz/dartz.dart';
import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/auth/data/sources/auth_service.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';

import '../../domain/entities/SignUpRequestEntity.dart';

class AuthRepositoryImpl extends AuthRepository{


  final AuthService _authService;
  AuthRepositoryImpl(this._authService);


  @override
  Future<Either> signin(String name) async {
    return await _authService.signin(name);
  }

  @override
  Future<DataState> signUp(SignUpRequestEntity signUpReq) async {
    return await _authService.signup(signUpReq);
  }

}
import 'package:dartz/dartz.dart';
import 'package:myapplication/features/auth/data/sources/auth_service.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';

class AuthRepositoryImpl extends AuthRepository{


  final AuthService _authService;
  AuthRepositoryImpl(this._authService);


  @override
  Future<Either> signin(String name) async {
    return await _authService.signin(name);
  }

  @override
  Future<Either> signup(String name) async {
    return await _authService.signup(name);
  }

}
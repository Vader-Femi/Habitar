import 'package:dartz/dartz.dart';
import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';

class SigninUseCase implements Usecase<Either,String> {


  final AuthRepository _authRepository;
  SigninUseCase(this._authRepository);

  @override
  Future<Either> call({String? params}) async {

    return _authRepository.signin(params!);
  }

}
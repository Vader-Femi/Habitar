import 'package:dartz/dartz.dart';
import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/core/usecase/usecase.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';

import '../entities/SignUpRequestEntity.dart';

class SignupUseCase implements Usecase<DataState,SignUpRequestEntity> {

  final AuthRepository _authRepository;
  SignupUseCase(this._authRepository);

  @override
  Future<DataState> call({SignUpRequestEntity? params}) async {
    return _authRepository.signUp(params!);
  }

}
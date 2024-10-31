import 'package:myapplication/core/res/data_state.dart';

import '../entities/SignUpRequestEntity.dart';

abstract class AuthRepository {

  Future<DataState> signUp(SignUpRequestEntity signUpReq);

  Future<DataState> signIn(String name);
}
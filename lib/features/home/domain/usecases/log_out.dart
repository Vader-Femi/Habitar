import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/usecase/usecase.dart';

class LogOutUseCase implements Usecase<void,dynamic> {

  final FirebaseAuth _firebaseAuth;
  LogOutUseCase(this._firebaseAuth);

  @override
  Future<void> call({dynamic params}) async {
    return await _firebaseAuth.signOut();
  }

}
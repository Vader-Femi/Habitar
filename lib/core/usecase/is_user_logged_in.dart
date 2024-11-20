import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/usecase/usecase.dart';

class IsUserLoggedIn implements Usecase<bool,dynamic> {

  IsUserLoggedIn();

  @override
  Future<bool> call({dynamic params}) async {
    return FirebaseAuth.instance.currentUser != null;
  }

}
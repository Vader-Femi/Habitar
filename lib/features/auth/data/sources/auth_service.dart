import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:habitar/features/home/data/models/user_model.dart';
import '../../../../core/res/data_state.dart';
import '../../domain/entities/SignInRequestEntity.dart';
import '../../domain/entities/SignUpRequestEntity.dart';

abstract class AuthService {
  Future<DataState> signup(SignUpRequestEntity signUpReq);

  Future<DataState> signIn(SignInRequestEntity signInReq);
}

class AuthServiceImpl extends AuthService {
  @override
  Future<DataState> signIn(SignInRequestEntity signInReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInReq.email,
        password: signInReq.password,
      );

      // Test version 1
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: "test@test.com",
      //   password: "testing123",
      // );

      // Test version 2
      // await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: "email@email.com",
      //   password: "testing123",
      // );

      return const DataSuccess("Sign up was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "The Password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exist with that email";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return DataFailed(errorMessage: message);
    }
  }

  @override
  Future<DataState> signup(SignUpRequestEntity signUpReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpReq.email, password: signUpReq.password);

      FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set(
            UserModel(
                    username: signUpReq.name,
                    email: data.user?.email ?? signUpReq.email,
                    habitsCompleted: "0")
                .toJson(),
          );

      //Test version 1
      // var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: "email@email.com", password: "testing123");
      //
      // FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set(
      //       UserModel(
      //               username: "Temporary Tester 1",
      //               email: data.user?.email ?? signUpReq.email,
      //               habitsCompleted: "0")
      //           .toJson(),
      //     );

      //Test version 2
      // var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: "email@email.com", password: "testing123");
      //
      // FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set(
      //       UserModel(
      //               username: "Temporary Tester 2",
      //               email: data.user?.email ?? signUpReq.email,
      //               habitsCompleted: "0")
      //           .toJson(),
      //     );

      return const DataSuccess("Sign up was successful");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == "weak-password") {
        message = "The Password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exist with that email";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return DataFailed(errorMessage: message);
    }
  }
}

import 'dart:io';
import 'package:dartz/dartz.dart';

abstract class AuthService {
  Future<Either> signup(String name);

  Future<Either> signin(String name);
}


class AuthServiceImpl extends AuthService {

  @override
  Future<Either> signin(String name) async {
    try {

      return const Right("Sign in was successful");

    } on HttpException catch (e) {
      String message = "";

      // if (e.code == "invalid-email") {
      //   message = "Email or password invalid";
      // } else if (e.code == "invalid-credential") {
      //   message = "Email or password invalid";
      // } else {
      //   message = e.message ?? "Something went wrong";
      // }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(String name) async {
    try {


      return const Right("Sign up was successful");
    } on HttpException catch (e) {

      String message = "";
      // if (e.code == "weak-password") {
      //   message = "The Password provided is too weak";
      // } else if (e.code == "email-already-in-use") {
      //   message = "An account already exist with that email";
      // } else {
      //   message = e.message ?? "Something went wrong";
      // }

      return Left(message);
    }
  }
}

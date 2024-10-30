import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapplication/core/res/data_state.dart';

import '../../domain/entities/SignUpRequestEntity.dart';

abstract class AuthService {
  Future<DataState> signup(SignUpRequestEntity signUpReq);

  Future<Either> signin(String name);
}


class AuthServiceImpl extends AuthService {

  @override
  Future<Either> signin(String name) async {

    /*
      try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserRequest.email, password: signInUserRequest.password);

      return const Right("Sign in was successful");

    } on FirebaseAuthException catch (e) {
      String message = "";

      if (e.code == "invalid-email") {
        message = "Email or password invalid";
      } else if (e.code == "invalid-credential") {
        message = "Email or password invalid";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return Left(message);
    }
       */


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
  Future<DataState> signup(SignUpRequestEntity signUpReq) async {

    try {

      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpReq.email, password: signUpReq.password);

      FirebaseFirestore.instance.collection("Users").doc(data.user?.uid).set({
        "name": signUpReq.name,
        "email": data.user?.email
      });



      return  const DataSuccess("Sign up was successful");
    } on FirebaseAuthException  catch (e) {

      String message = "";
      if (e.code == "weak-password") {
        message = "The Password provided is too weak";
      } else if (e.code == "email-already-in-use") {
        message = "An account already exist with that email";
      } else {
        message = e.message ?? "Something went wrong";
      }

      return DataFailed(
          errorMessage: message
      );
    }
  }
}

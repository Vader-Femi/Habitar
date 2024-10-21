import 'package:dartz/dartz.dart';

abstract class AuthRepository {

  Future<Either> signup(String name);

  Future<Either> signin(String name);
}
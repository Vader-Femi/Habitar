import 'package:equatable/equatable.dart';

class SignInRequestEntity extends Equatable {
  final String email;
  final String password;

  const SignInRequestEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

}
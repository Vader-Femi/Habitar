import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {

  final bool? showPassword;
  final String ? errorMessage;

  const SignUpState({this.errorMessage, this.showPassword});

  @override
  List<Object?> get props => [showPassword!, errorMessage!];
}

class ShowPasswordChanged extends SignUpState {
  const ShowPasswordChanged(bool showPassword) : super(showPassword: showPassword);
}

class SignUpLoading extends SignUpState {
  const SignUpLoading();
}

class SignUpInit extends SignUpState {
  const SignUpInit();
}

class SignUpDone extends SignUpState {
  const SignUpDone();
}

class SignUpError extends SignUpState {
  const SignUpError(String errorMessage) : super(errorMessage: errorMessage);
}

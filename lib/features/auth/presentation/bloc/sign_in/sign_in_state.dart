import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {

  final bool showPassword;
  final String ? errorMessage;

  const SignInState({this.errorMessage, this.showPassword = true});

  @override
  List<Object?> get props => [showPassword, errorMessage];
}

class ShowPasswordChanged extends SignInState {
  const ShowPasswordChanged(bool showPassword) : super(showPassword: showPassword);
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInInit extends SignInState {
  const SignInInit();
}

class SignInSuccess extends SignInState {
  const SignInSuccess();
}

class SignInError extends SignInState {
  const SignInError(String errorMessage) : super(errorMessage: errorMessage);
}
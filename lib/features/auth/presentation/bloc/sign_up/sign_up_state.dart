import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {

  final bool showPassword;
  final String ? errorMessage;

  const SignUpState({this.errorMessage, this.showPassword = true});

  @override
  List<Object?> get props => [showPassword, errorMessage];
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

class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
}

class SignUpError extends SignUpState {
  const SignUpError(String errorMessage) : super(errorMessage: errorMessage);
}

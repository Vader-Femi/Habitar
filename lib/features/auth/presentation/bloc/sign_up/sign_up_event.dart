abstract class SignUpEvent {
  const SignUpEvent();
}

class InitSignUp extends SignUpEvent {
  const InitSignUp();
}

class UpdateShowPassword extends SignUpEvent {
  final bool showPassword;
  const UpdateShowPassword(this.showPassword);
}

class TrySignUp extends SignUpEvent {
  final String name;
  final String email;
  final String password;

  const TrySignUp({required this.name, required this.email, required this.password});
}

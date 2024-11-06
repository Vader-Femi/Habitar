abstract class SignInEvent {
  const SignInEvent();
}

class InitSignIn extends SignInEvent {
  const InitSignIn();
}

class UpdateShowPassword extends SignInEvent {
  final bool showPassword;
  const UpdateShowPassword(this.showPassword);
}

class TrySignIn extends SignInEvent {
  final String email;
  final String password;

  const TrySignIn({required this.email, required this.password});
}

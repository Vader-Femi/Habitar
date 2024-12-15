import 'package:habitar/common/helpers/validation/validation_result.dart';

class ValidatePassword {

  const ValidatePassword();

  ValidationResult execute(String email) {
    if (email.isEmpty) {
      return ValidationResult(
          false,
          "Password cannot be empty"
      );
    }

    var passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (passwordRegExp.hasMatch(email)) {
      return ValidationResult(
          false,
          "Must contain a 1 upper case, 1 lowercase, 1 number, 1 special character, and 8 characters"
      );
    }

    return ValidationResult(
        true,
        null
    );
  }

}
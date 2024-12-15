import 'package:habitar/common/helpers/validation/validation_result.dart';

class ValidateEmail {

  const ValidateEmail();

  ValidationResult execute(String email) {

    if (email.isEmpty){
      return ValidationResult(
          false,
          "Email cannot be empty"
      );
    }

    var emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (emailRegExp.hasMatch(email)){
      return ValidationResult(
          false,
          "Must be a valid email"
      );
    }

    return ValidationResult(
        true,
        null
    );

  }

}
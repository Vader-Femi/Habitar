import 'package:habitar/common/helpers/validation/validation_result.dart';

class ValidateLoginPassword {

  const ValidateLoginPassword();

  ValidationResult execute(String password) {

    if (password.isEmpty){
      return ValidationResult(
          false,
          "Password cannot be empty"
      );
    }

    return ValidationResult(
        true,
        null
    );

  }

}
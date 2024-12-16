import 'package:habitar/common/helpers/validation/validation_result.dart';

class ValidateUsername {

  const ValidateUsername();

  ValidationResult execute(String username) {

    if (username.isEmpty){
      return ValidationResult(
          false,
          "Name cannot be empty"
      );
    }

    return ValidationResult(
        true,
        null
    );

  }

}
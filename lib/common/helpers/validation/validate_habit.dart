import 'package:habitar/common/helpers/validation/validation_result.dart';

class ValidateHabit {

  const ValidateHabit();

  ValidationResult execute(String habit) {

    if (habit.isEmpty){
      return ValidationResult(
          false,
          "Habit cannot be empty"
      );
    }

    return ValidationResult(
        true,
        null
    );

  }

}
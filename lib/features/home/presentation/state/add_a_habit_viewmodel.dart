import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:collection/collection.dart';
import 'package:form_validation/form_validation.dart';
import 'package:habitar/common/helpers/validation/validate_habit.dart';
import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import '../../../../common/helpers/day_of_week.dart';
import '../../../../common/helpers/time_names.dart';
import '../../../../common/helpers/time_of_day.dart';
import '../../../../common/helpers/week_names.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/add_a_habit.dart';

AddAHabitViewModel get addAHabitViewModel => Super.init(AddAHabitViewModel());

class AddAHabitViewModel{

  final TextEditingController _habit = TextEditingController();
  TextEditingController getHabitController() => _habit;

  final weekdays = <ReminderDayOfWeek>[
    ReminderDayOfWeek(weekNames: weekNames[0], isSelected: true),
    ReminderDayOfWeek(weekNames: weekNames[1], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[2], isSelected: true),
    ReminderDayOfWeek(weekNames: weekNames[3], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[4], isSelected: true),
    ReminderDayOfWeek(weekNames: weekNames[5], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[6], isSelected: false),
  ].rx;

  void togglePeriodicity(int index) {

    final day = weekdays[index];
    weekdays.removeAt(index);
    weekdays.insert(index, day.copyWith(isSelected: !day.isSelected));

  }

  final timeOfDay = <ReminderTimeOfDay>[
    ReminderTimeOfDay(
        timeIcon: Icons.wb_twilight_rounded,
        timeTitle: "Morning",
        isSelected: false),
    ReminderTimeOfDay(
        timeIcon: Icons.wb_sunny_rounded,
        timeTitle: "Afternoon",
        isSelected: false),
    ReminderTimeOfDay(
        timeIcon: Icons.dark_mode_rounded,
        timeTitle: "Evening",
        isSelected: true)
  ].rx;

  void toggleTImeOfDay(int index) {

    final day = timeOfDay[index];
    timeOfDay.removeAt(index);
    timeOfDay.insert(index, day.copyWith(isSelected: !day.isSelected));

  }

  Future<DataState> addANewHabit() async {

    //Old way
    // var validateHabit = sl<ValidateHabit>().execute(_habit.text);
    // if (!validateHabit.isSuccessful){
    //   return DataFailed( errorMessage:  validateHabit.error ?? "Something went wrong with the habit");
    // }

    final habitValidator = Validator(
      validators: [
        const MinLengthValidator(length: 1),
        const RequiredValidator(),
      ],
    );
    var habitValidatorError = habitValidator.validate(
      label: 'Habit is required',
      value: _habit.text,
    );

    if (habitValidatorError != null){
      return DataFailed( errorMessage:  habitValidatorError ?? "Something went wrong with the habit");
    }

    var selectedPeriodicity = <String>[];
    weekdays.forEachIndexed((index, element) {
      if(element.isSelected == true){
        selectedPeriodicity.add(element.weekNames.longName) ;
      }
    });
    var selectedTimeOfDay = <String>[];
    timeOfDay.forEachIndexed((index, element) {
      if(element.isSelected == true){
        selectedTimeOfDay.add(timeNames[index].name);
      }
    });
    var addAHabitEntity = AddAHabitEntity(
      habit: _habit.text,
      selectedPeriodicity: selectedPeriodicity,
      selectedTimeOfDay: selectedTimeOfDay,
      streak: "0",
      lastDateTicked: ""
    );
    return await sl<AddAHabitUseCase>().call(params: addAHabitEntity);
  }
}

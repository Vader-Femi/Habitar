import 'package:flutter/material.dart';
import '../../../../common/helpers/day_of_week.dart';
import '../../../../common/helpers/time_of_day.dart';

abstract class AddNewHabitState {
  final TextEditingController habit = TextEditingController();
  final String? errorMessage;
  final bool? showPassword;

  TextEditingController getHabitController() => habit;

  List<ReminderDayOfWeek> dayOfWeek = [
    ReminderDayOfWeek(dayTitle: "M", isSelected: true),
    ReminderDayOfWeek(dayTitle: "T", isSelected: false),
    ReminderDayOfWeek(dayTitle: "W", isSelected: true),
    ReminderDayOfWeek(dayTitle: "T", isSelected: false),
    ReminderDayOfWeek(dayTitle: "F", isSelected: true),
    ReminderDayOfWeek(dayTitle: "S", isSelected: false),
    ReminderDayOfWeek(dayTitle: "S", isSelected: false),
  ];

  final List<ReminderTimeOfDay> timeOfDay = [
    ReminderTimeOfDay(
        timeIcon: Icons.wb_sunny_rounded,
        timeTitle: "Afternoon",
        isSelected: false),
    ReminderTimeOfDay(
        timeIcon: Icons.wb_twilight_rounded,
        timeTitle: "Morning",
        isSelected: false),
    ReminderTimeOfDay(
        timeIcon: Icons.dark_mode_rounded,
        timeTitle: "Evening",
        isSelected: true)
  ];

  AddNewHabitState({this.errorMessage, this.showPassword});
}

class AddingHabit extends AddNewHabitState {
  AddingHabit();
}

class InitScreen extends AddNewHabitState {
  InitScreen();
}

class TogglePeriodicity extends AddNewHabitState {
  final int index;

  TogglePeriodicity({required this.index}) {
    dayOfWeek[index].isSelected = !dayOfWeek[index].isSelected;
  }
}

class ToggleTImeOfDay extends AddNewHabitState {
  final int index;
  ToggleTImeOfDay({required this.index}){
    timeOfDay[index].isSelected = !timeOfDay[index].isSelected;
  }
}

class AddingHabitSuccess extends AddNewHabitState {
  AddingHabitSuccess();
}

class AddingHabitError extends AddNewHabitState {
  AddingHabitError(String errorMessage) : super(errorMessage: errorMessage);
}

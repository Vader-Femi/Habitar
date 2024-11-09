import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import '../../../../common/helpers/day_of_week.dart';
import '../../../../common/helpers/time_of_day.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';

AddNewHabitViewModel get addNewHabitViewModel => Super.init(AddNewHabitViewModel());

class AddNewHabitViewModel{

  final TextEditingController _habit = TextEditingController();
  TextEditingController getHabitController() => _habit;

  final weekdays = <ReminderDayOfWeek>[
    ReminderDayOfWeek(dayTitle: "M", isSelected: true),
    ReminderDayOfWeek(dayTitle: "T", isSelected: false),
    ReminderDayOfWeek(dayTitle: "W", isSelected: true),
    ReminderDayOfWeek(dayTitle: "T", isSelected: false),
    ReminderDayOfWeek(dayTitle: "F", isSelected: true),
    ReminderDayOfWeek(dayTitle: "S", isSelected: false),
    ReminderDayOfWeek(dayTitle: "S", isSelected: false),
  ].rx;

  void togglePeriodicity(int index) {

    final day = weekdays[index];
    weekdays.removeAt(index);
    weekdays.insert(index, day.copyWith(isSelected: !day.isSelected));

  }

  final timeOfDay = <ReminderTimeOfDay>[
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
  ].rx;

  void toggleTImeOfDay(int index) {

    final day = timeOfDay[index];
    timeOfDay.removeAt(index);
    timeOfDay.insert(index, day.copyWith(isSelected: !day.isSelected));

  }

  DataState addANewHabit(){
    throw UnimplementedError("Setup add use case");
  }
}

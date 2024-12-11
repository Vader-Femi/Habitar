import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:collection/collection.dart';
import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/usecases/delete_single_habit_from_db.dart';
import '../../../../common/helpers/day_of_week.dart';
import '../../../../common/helpers/time_names.dart';
import '../../../../common/helpers/time_of_day.dart';
import '../../../../common/helpers/week_names.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../data/models/HabitModel.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/usecases/add_a_habit.dart';

UpdateHabitViewmodel get updateHabitViewmodel =>
    Super.init(UpdateHabitViewmodel());

class UpdateHabitViewmodel {
  RxT<HabitEntity> oldHabit = HabitEntity(
          habit: "",
          selectedTimeOfDay: [],
          lastDateTicked: "",
          selectedPeriodicity: [],
          streak: "")
      .rx;

  final TextEditingController _habit = TextEditingController();

  TextEditingController getHabitController() => _habit;

  final weekdays = <ReminderDayOfWeek>[
    ReminderDayOfWeek(weekNames: weekNames[0], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[1], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[2], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[3], isSelected: false),
    ReminderDayOfWeek(weekNames: weekNames[4], isSelected: false),
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
        isSelected: false)
  ].rx;

  void toggleTImeOfDay(int index) {
    final day = timeOfDay[index];
    timeOfDay.removeAt(index);
    timeOfDay.insert(index, day.copyWith(isSelected: !day.isSelected));
  }

  void initHabit(HabitEntity oldHabit) {

    _habit.text = oldHabit.habit;

    weekdays.forEachIndexed((index, element) {
      var isSelected =
          oldHabit.selectedPeriodicity.contains(element.weekNames.longName);
      weekdays.removeAt(index);
      weekdays.insert(index, element.copyWith(isSelected: isSelected));
    });

    timeOfDay.forEachIndexed((index, element) {
      var isSelected =
      oldHabit.selectedTimeOfDay.contains(element.timeTitle);
      timeOfDay.removeAt(index);
      timeOfDay.insert(index, element.copyWith(isSelected: isSelected));
    });
  }

  Future<DataState> updateHabit() async {
    var selectedPeriodicity = <String>[];
    weekdays.forEachIndexed((index, element) {
      if (element.isSelected == true) {
        selectedPeriodicity.add(element.weekNames.longName);
      }
    });
    var selectedTimeOfDay = <String>[];
    timeOfDay.forEachIndexed((index, element) {
      if (element.isSelected == true) {
        selectedTimeOfDay.add(timeNames[index].name);
      }
    });
    var updateAHabitEntity = AddAHabitEntity(
        habit: _habit.text,
        selectedPeriodicity: selectedPeriodicity,
        selectedTimeOfDay: selectedTimeOfDay,
        streak: "0",
        lastDateTicked: "");
    return await sl<AddAHabitUseCase>().call(params: updateAHabitEntity);
  }

  Future<void> deleteHabit() async {
    // return sl<DeleteSingleHabitFromDbUseCase>().call(params: habitModel);
  }
}

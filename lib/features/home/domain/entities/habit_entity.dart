import 'package:habitar/features/home/data/models/HabitModel.dart';

import 'add_a_habit_req_entity.dart';

class HabitEntity {
  final String habit;
  final List<String> selectedPeriodicity;
  final List<String> selectedTimeOfDay;
  final String streak;
  final String lastDateTicked;

  const HabitEntity({required this.habit, required this.selectedPeriodicity, required this.selectedTimeOfDay, required this.streak, required this.lastDateTicked});

  Map<String, dynamic> toJson() {
    return {
      'habit': habit,
      'selectedPeriodicity': selectedPeriodicity,
      'selectedTimeOfDay': selectedTimeOfDay,
      'streak': streak,
      'lastDateTicked': lastDateTicked,
    };
  }

  factory HabitEntity.fromJson(Map<String, dynamic> json) {
    return HabitEntity(
      habit: json["habit"],
      selectedPeriodicity: json["selectedPeriodicity"].cast<String>(),
      selectedTimeOfDay: json["selectedTimeOfDay"].cast<String>(),
      streak: json["streak"],
      lastDateTicked: json["lastDateTicked"],
    );
  }

  factory HabitEntity.fromModel(
      HabitModel entity) {
    return HabitEntity(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }

  factory HabitEntity.fromAddAHabitEntity(
      AddAHabitEntity entity) {
    return HabitEntity(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }
}
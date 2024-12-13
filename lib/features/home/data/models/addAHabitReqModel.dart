import 'package:habitar/features/home/data/models/HabitModel.dart';

import '../../domain/entities/add_a_habit_req_entity.dart';
import '../../domain/entities/habit_entity.dart';
import '../../domain/entities/update_a_habit_req_entity.dart';

class AddAHabitModel extends AddAHabitEntity{

  const AddAHabitModel({
    required super.habit,
    required super.selectedPeriodicity,
    required super.selectedTimeOfDay,
    required super.streak,
    required super.lastDateTicked
});

  AddAHabitModel copyWith(
      {String? habit, List<String>? selectedPeriodicity, List<String>? selectedTimeOfDay, String? streak, String? lastDateTicked}) {
    return AddAHabitModel(
      habit: habit ?? this.habit,
      selectedPeriodicity: selectedPeriodicity ?? this.selectedPeriodicity,
      selectedTimeOfDay: selectedTimeOfDay ?? this.selectedTimeOfDay,
      streak: streak ?? this.streak,
      lastDateTicked: lastDateTicked ?? this.lastDateTicked,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'habit': habit,
      'selectedPeriodicity': selectedPeriodicity,
      'selectedTimeOfDay': selectedTimeOfDay,
      'streak': streak,
      "lastDateTicked": lastDateTicked,
    };
  }


  factory AddAHabitModel.fromJson(Map<String, dynamic> json) {
    return AddAHabitModel(
      habit: json["habit"],
      selectedPeriodicity: json["selectedPeriodicity"].cast<String>(),
      selectedTimeOfDay: json["selectedTimeOfDay"].cast<String>(),
      streak: json["streak"],
      lastDateTicked: json["lastDateTicked"]
    );
  }


  factory AddAHabitModel.fromEntity(
      AddAHabitEntity entity) {
    return AddAHabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }

  factory AddAHabitModel.fromHabitEntity(
      HabitEntity entity) {
    return AddAHabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }

  factory AddAHabitModel.fromUpdateAHabitReqEntity(
      UpdateAHabitReqEntity entity) {
    return AddAHabitModel(
      habit: entity.newHabit.habit,
      selectedPeriodicity: entity.newHabit.selectedPeriodicity,
      selectedTimeOfDay: entity.newHabit.selectedTimeOfDay,
      streak: entity.newHabit.streak,
      lastDateTicked: entity.newHabit.lastDateTicked,
    );
  }

  factory AddAHabitModel.fromHabitModel(
      HabitModel entity) {
    return AddAHabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }

}
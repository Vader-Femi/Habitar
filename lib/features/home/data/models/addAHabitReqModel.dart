import '../../domain/entities/add_a_habit_req_entity.dart';

class AddAHabitModel extends AddAHabitEntity{

  const AddAHabitModel({
    required super.habit,
    required super.selectedPeriodicity,
    required super.selectedTimeOfDay,
    required super.streak,
    required super.lastDateTicked
});

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

}
import '../../domain/entities/habit_entity.dart';

class HabitModel extends HabitEntity{

  const HabitModel({
    required super.habit,
    required super.selectedPeriodicity,
    required super.selectedTimeOfDay,
});

  Map<String, dynamic> toJson() {
    return {
      'habit': habit,
      'selectedPeriodicity': selectedPeriodicity,
      'selectedTimeOfDay': selectedTimeOfDay,
    };
  }

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      habit: json["habit"],
      selectedPeriodicity: json["selectedPeriodicity"].cast<String>(),
      selectedTimeOfDay: json["selectedTimeOfDay"].cast<String>(),
    );
  }


  factory HabitModel.fromEntity(
      HabitEntity entity) {
    return HabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
    );
  }

}
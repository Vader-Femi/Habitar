import '../../domain/entities/add_a_habit_req_entity.dart';

class AddAHabitModel extends AddAHabitEntity{

  const AddAHabitModel({
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

  factory AddAHabitModel.fromJson(Map<String, dynamic> json) {
    return AddAHabitModel(
      habit: json["habit"],
      selectedPeriodicity: json["selectedPeriodicity"],
      selectedTimeOfDay: json["selectedTimeOfDay"],
    );
  }


  factory AddAHabitModel.fromEntity(
      AddAHabitEntity entity) {
    return AddAHabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
    );
  }

}

import '../../domain/entities/habit_entity.dart';
import '../db/habit_db.dart';

class HabitModel extends HabitEntity{

  const HabitModel({
    required super.habit,
    required super.selectedPeriodicity,
    required super.selectedTimeOfDay,
    required super.streak,
    required super.lastDateTicked,
});

  HabitModel copyWith(
      {String? habit, List<String>? selectedPeriodicity, List<String>? selectedTimeOfDay, String? streak, String? lastDateTicked}) {
    return HabitModel(
      habit: habit ?? this.habit,
      selectedPeriodicity: selectedPeriodicity ?? this.selectedPeriodicity,
      selectedTimeOfDay: selectedTimeOfDay ?? this.selectedTimeOfDay,
      streak: streak ?? this.streak,
      lastDateTicked: lastDateTicked ?? this.lastDateTicked,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'habit': habit,
      'selectedPeriodicity': selectedPeriodicity,
      'selectedTimeOfDay': selectedTimeOfDay,
      'streak': streak,
      'lastDateTicked': lastDateTicked,
    };
  }

  HabitTableCompanion toHabitTableCompanion() {
    return HabitTableCompanion.insert(
      habit: habit,
      selectedPeriodicity: selectedPeriodicity ,
      selectedTimeOfDay: selectedTimeOfDay,
      streak: streak,
      lastDateTicked: lastDateTicked,
    );
  }

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      habit: json["habit"],
      selectedPeriodicity: json["selectedPeriodicity"].cast<String>(),
      selectedTimeOfDay: json["selectedTimeOfDay"].cast<String>(),
      streak: json["streak"],
      lastDateTicked: json["lastDateTicked"],
    );
  }


  factory HabitModel.fromEntity(
      HabitEntity entity) {
    return HabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }

  factory HabitModel.fromHabitTableData(
      HabitTableData entity) {
    return HabitModel(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
      streak: entity.streak,
      lastDateTicked: entity.lastDateTicked,
    );
  }

}
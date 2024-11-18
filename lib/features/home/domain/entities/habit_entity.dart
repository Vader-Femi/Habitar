import 'package:habitar/features/home/data/models/HabitModel.dart';

class HabitEntity {
  final String habit;
  final List<String> selectedPeriodicity;
  final List<String> selectedTimeOfDay;
  final String streak;
  final String lastDateTicked;

  const HabitEntity({required this.habit, required this.selectedPeriodicity, required this.selectedTimeOfDay, required this.streak, required this.lastDateTicked});

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
}
import 'package:habitar/features/home/data/models/HabitModel.dart';

class HabitEntity {
  final String habit;
  final List<String> selectedPeriodicity;
  final List<String> selectedTimeOfDay;

  const HabitEntity({required this.habit, required this.selectedPeriodicity, required this.selectedTimeOfDay});

  factory HabitEntity.fromModel(
      HabitModel entity) {
    return HabitEntity(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      selectedTimeOfDay: entity.selectedTimeOfDay,
    );
  }
}
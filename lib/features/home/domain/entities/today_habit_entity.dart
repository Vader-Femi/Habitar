import 'package:habitar/features/home/data/models/HabitModel.dart';

class TodayHabitEntity {
  final String habit;
  final List<String> selectedPeriodicity;
  final bool isSelected;

  const TodayHabitEntity({
    required this.habit,
    required this.selectedPeriodicity,
    this.isSelected = false,
  });

  TodayHabitEntity copyWith(
      {String? habit, List<String>? selectedPeriodicity, bool? isSelected}) {
    return TodayHabitEntity(
      habit: habit ?? this.habit,
      selectedPeriodicity: selectedPeriodicity ?? this.selectedPeriodicity,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory TodayHabitEntity.fromModel(HabitModel entity) {
    return TodayHabitEntity(
      habit: entity.habit,
      selectedPeriodicity: entity.selectedPeriodicity,
      isSelected: false,
    );
  }
}

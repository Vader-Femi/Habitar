import 'package:habitar/common/helpers/get_today_date.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';

class TodayHabitEntity {
  final HabitModel habit;
  final bool isSelected;

  const TodayHabitEntity({
    required this.habit,
    this.isSelected = false,
  });

  TodayHabitEntity copyWith(
      {HabitModel? habit, List<String>? selectedPeriodicity, bool? isSelected}) {
    return TodayHabitEntity(
      habit: habit ?? this.habit,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory TodayHabitEntity.fromModel(HabitModel entity) {
    return TodayHabitEntity(
      habit: entity,
      isSelected: entity.lastDateTicked == getTodayDate() ? true : false,
    );
  }
}

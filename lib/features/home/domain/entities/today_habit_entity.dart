import 'package:habitar/common/helpers/get_today_date.dart';
import 'package:habitar/features/home/data/db/habit_db.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';

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

  factory TodayHabitEntity.fromModel(HabitModel model) {
    return TodayHabitEntity(
      habit: model,
      isSelected: model.lastDateTicked == getTodayDate() ? true : false,
    );
  }

  factory TodayHabitEntity.fromEntity(HabitEntity entity) {
    return TodayHabitEntity(
      habit: HabitModel.fromEntity(entity),
      isSelected: entity.lastDateTicked == getTodayDate() ? true : false,
    );
  }

  factory TodayHabitEntity.fromHabitTableData(HabitTableData entity) {
    return TodayHabitEntity(
      habit: HabitModel.fromHabitTableData(entity),
      isSelected: entity.lastDateTicked == getTodayDate() ? true : false,
    );
  }
}

import 'package:habitar/features/home/data/models/addAHabitReqModel.dart';

class AddAHabitEntity {
  final String habit;
  final List<String> selectedPeriodicity;
  final List<String> selectedTimeOfDay;
  final String streak;
  final String lastDateTicked;

  const AddAHabitEntity({required this.habit, required this.selectedPeriodicity, required this.selectedTimeOfDay, required this.streak, required this.lastDateTicked});

  factory AddAHabitEntity.fromModel(
      AddAHabitModel model) {
    return AddAHabitEntity(
      habit: model.habit,
      selectedPeriodicity: model.selectedPeriodicity,
      selectedTimeOfDay: model.selectedTimeOfDay,
      streak: model.streak,
      lastDateTicked: model.lastDateTicked,
    );
  }

}
import 'package:habitar/features/home/data/models/updateAHabitReqModel.dart';
import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';

class UpdateAHabitReqEntity {
  final String oldId;
  final AddAHabitEntity newHabit;

  const UpdateAHabitReqEntity({required this.oldId, required this.newHabit});

  factory UpdateAHabitReqEntity.fromModel(
      UpdateAHabitReqModel model) {
    return UpdateAHabitReqEntity(
      oldId: model.oldId,
      newHabit: AddAHabitEntity.fromModel(model.newHabit),
    );
  }
}
import 'package:habitar/features/home/data/models/addAHabitReqModel.dart';
import 'package:habitar/features/home/domain/entities/update_a_habit_req_entity.dart';
import '../../domain/entities/add_a_habit_req_entity.dart';

class UpdateAHabitReqModel extends UpdateAHabitReqEntity {

  @override
  final String oldId;
  @override
  final AddAHabitModel newHabit;

  UpdateAHabitReqModel({
    required this.oldId,
    required this.newHabit,
  }) : super(oldId: oldId, newHabit: AddAHabitEntity.fromModel(newHabit));


  Map<String, dynamic> toJson() {
    return {
      'old_id': oldId,
      'new_habit': newHabit.toJson(),
    };
  }

  factory UpdateAHabitReqModel.fromJson(Map<String, dynamic> json) {
    return UpdateAHabitReqModel(
        oldId: json["old_id"],
        newHabit: json["new_habit"].cast<AddAHabitModel>(),
    );
  }

  factory UpdateAHabitReqModel.fromEntity(UpdateAHabitReqEntity entity) {
    return UpdateAHabitReqModel(
      oldId: entity.oldId,
      newHabit: AddAHabitModel.fromEntity(entity.newHabit),
    );
  }
}

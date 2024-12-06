import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/updateAHabitReqModel.dart';

class UpdateHabitInDbUseCase implements Usecase<void,UpdateAHabitReqModel> {

  final HabitDBHelper _habitDBHelper;
  UpdateHabitInDbUseCase(this._habitDBHelper);

  @override
  Future<void> call({UpdateAHabitReqModel? params}) async {
    return _habitDBHelper.updateHabit(params!);
  }

}
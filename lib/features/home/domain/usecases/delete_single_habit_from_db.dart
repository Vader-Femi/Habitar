import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';

class DeleteSingleHabitFromDbUseCase implements Usecase<void, HabitModel> {

  final HabitDBHelper _habitDBHelper;
  DeleteSingleHabitFromDbUseCase(this._habitDBHelper);

  @override
  Future<void> call({HabitModel? params}) async {
    return _habitDBHelper.deleteHabits(params!);
  }

}
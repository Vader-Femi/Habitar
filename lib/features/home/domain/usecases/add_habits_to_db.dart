import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';

class AddHabitsToDBUseCase implements Usecase<void,HabitModel> {

  final HabitDBHelper _habitDBHelper;
  AddHabitsToDBUseCase(this._habitDBHelper);

  @override
  Future<void> call({HabitModel? params}) async {
    return _habitDBHelper.addHabit(params!);
  }

}
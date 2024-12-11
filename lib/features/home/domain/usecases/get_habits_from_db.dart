import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';

class GetHabitsFromDBUseCase implements Usecase<List<HabitModel>,dynamic> {

  final HabitDBHelper _habitDBHelper;
  GetHabitsFromDBUseCase(this._habitDBHelper);

  @override
  Future<List<HabitModel>> call({dynamic params}) async {
    return _habitDBHelper.getHabitsAlphabetically();
  }

}
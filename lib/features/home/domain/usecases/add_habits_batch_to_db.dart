import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';

class AddHabitsBatchToDBUseCase implements Usecase<void,List<HabitModel>> {

  final HabitDBHelper _habitDBHelper;
  AddHabitsBatchToDBUseCase(this._habitDBHelper);

  @override
  Future<void> call({List<HabitModel>? params}) async {
    return _habitDBHelper.insertMultipleHabits(params ?? []);
  }

}
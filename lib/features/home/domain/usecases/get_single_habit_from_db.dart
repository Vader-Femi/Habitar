import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';

class GetSingleHabitFromDBUseCase implements Usecase<HabitModel?,String> {

  final HabitDBHelper _habitDBHelper;
  GetSingleHabitFromDBUseCase(this._habitDBHelper);

  @override
  Future<HabitModel?> call({String? params}) async {
    return _habitDBHelper.getSingleHabit(params!);
  }

}
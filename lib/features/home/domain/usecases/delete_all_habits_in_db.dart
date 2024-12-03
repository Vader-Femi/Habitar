import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import '../../../../core/usecase/usecase.dart';

class DeleteAllHabitsInDBUseCase implements Usecase<void, dynamic> {

  final HabitDBHelper _habitDBHelper;
  DeleteAllHabitsInDBUseCase(this._habitDBHelper);

  @override
  Future<void> call({dynamic params}) async {
    return _habitDBHelper.deleteAllHabits();
  }

}
import 'package:habitar/features/home/data/db/habitDBHelper.dart';
import 'package:habitar/features/home/data/models/HabitModel.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/db/habit_db.dart';

class WatchHabitsFromDBUseCase implements Usecase<Stream<List<HabitTableData>>,dynamic> {

  final HabitDBHelper _habitDBHelper;
  WatchHabitsFromDBUseCase(this._habitDBHelper);

  @override
  Future<Stream<List<HabitTableData>>> call({dynamic params}) async {
    return _habitDBHelper.watchHabitsAlphabetically();
  }

}
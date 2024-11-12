import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/get_habits.dart';

GetHabitsViewModel get getHabitsViewModel => Super.init(GetHabitsViewModel());

class GetHabitsViewModel {

  var habits = <HabitEntity>[].rx;

  Future<DataState> getHabits() async {
    var result = await sl<GetHabitsUseCase>().call();
    if (result is DataSuccess){
      for (var habitModel in result.data) {
        habits.add(HabitEntity.fromModel(habitModel));
      }
    }
    return result;
  }
}

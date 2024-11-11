import 'package:habitar/features/home/data/sources/home_service.dart';
import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import '../../../../core/res/data_state.dart';
import '../../domain/repository/home.dart';

class HomeRepositoryImpl extends HomeRepository{

  final HomeService _homeService;
  HomeRepositoryImpl(this._homeService);

  @override
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq) => _homeService.addAHabit(newHabitReq);

}
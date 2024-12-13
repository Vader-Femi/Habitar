import 'package:habitar/features/home/data/sources/home_service.dart';
import 'package:habitar/features/home/domain/entities/add_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/entities/update_a_habit_req_entity.dart';
import 'package:habitar/features/home/domain/entities/user.dart';
import '../../../../core/res/data_state.dart';
import '../../domain/entities/today_habit_entity.dart';
import '../../domain/repository/home.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService _homeService;

  HomeRepositoryImpl(this._homeService);

  @override
  Future<DataState> addAHabit(AddAHabitEntity newHabitReq) =>
      _homeService.addAHabit(newHabitReq);

  @override
  Future<DataState> getAllHabits() => _homeService.getAllHabits();

  @override
  Future<DataState> tickHabit(TodayHabitEntity todayHabitEntity) =>
      _homeService.tickHabit(todayHabitEntity);

  @override
  Future<UserEntity> getUser() => _homeService.getUser();

  @override
  Future<DataState> deleteHabit(HabitEntity habitEntity) =>
      _homeService.deleteHabit(habitEntity);

  @override
  Future<DataState> updateHabit(UpdateAHabitReqEntity updateAHabitReqEntity) =>
      _homeService.updateHabit(updateAHabitReqEntity);
}

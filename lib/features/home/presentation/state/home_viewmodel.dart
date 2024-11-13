import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/get_habits.dart';

HomeViewModel get getHomeViewModel => Super.init(HomeViewModel());

class HomeViewModel {

  var selectedTabIndex = 0.rx;

  void selectTabAtIndex(int index) => selectedTabIndex.state = index;
}

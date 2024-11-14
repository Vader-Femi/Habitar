import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/user.dart';
import 'package:habitar/features/home/domain/usecases/get_user.dart';
import '../../../../service_locator.dart';

HomeViewModel get getHomeViewModel => Super.init(HomeViewModel());

class HomeViewModel {
  var selectedTabIndex = 0.rx;

  var user = UserEntity(
    username: "",
    email: "",
    habitsCompleted: "-1",
  ).rx;

  void selectTabAtIndex(int index) => selectedTabIndex.state = index;

  Future<void> getUser() async {
    var result = await sl<GetUserUseCase>().call();
    user = UserEntity(
      username: result.username,
      email: result.email,
      habitsCompleted: result.habitsCompleted,
    ).rx;
  }
}

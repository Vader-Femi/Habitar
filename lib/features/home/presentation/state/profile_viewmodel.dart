import 'package:flutter_super/flutter_super.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/get_habits.dart';

ProfileViewModel get getProfileViewModel => Super.init(ProfileViewModel());

class ProfileViewModel {

  Future<DataState> getHabits() async {
    return await sl<GetHabitsUseCase>().call();
  }

  Future<DataState> logOut() async {
    return DataFailed();
  }

  Future<DataState> deleteAccount() async {
    return DataFailed();
  }
}

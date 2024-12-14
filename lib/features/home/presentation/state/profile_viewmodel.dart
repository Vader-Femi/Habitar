import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/update_user_profile.dart';

ProfileViewModel get getProfileViewModel => Super.init(ProfileViewModel());

class ProfileViewModel {
  var editingProfile = false.rx;

  final TextEditingController _userName = TextEditingController();

  TextEditingController getUserNameController() => _userName;

  final TextEditingController _email = TextEditingController();

  TextEditingController getEmailController() => _email;

  Future<DataState> getHabits() async {
    return await sl<GetHabitsUseCase>().call();
  }

  void toggleEditingProfile() async {
    _userName.text = getHomeViewModel.user.state.username;
    editingProfile.state = !editingProfile.state;
  }

  Future<DataState> updateProfile() async {
    var result =
        await sl<UpdateUserProfileUseCase>().call(params: _userName.text);

    toggleEditingProfile();
    return result;
  }

  Future<DataState> logOut() async {
    return DataFailed();
  }

  Future<DataState> deleteAccount() async {
    return DataFailed();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:form_validation/form_validation.dart';
import 'package:habitar/common/helpers/validation/validate_username.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/res/data_state.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/get_habits.dart';
import '../../domain/usecases/log_out.dart';
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
    final usernameValidator = Validator(
      validators: [
        const MinLengthValidator(length: 1),
        const RequiredValidator(),
      ],
    );
    var usernameValidatorError = usernameValidator.validate(
      label: 'Username is required',
      value: _userName.text,
    );

    if (usernameValidatorError != null){
      return DataFailed( errorMessage:  usernameValidatorError ?? "Something went wrong with the habit");

    // Old way
    // var validateUsername = sl<ValidateUsername>().execute(_userName.text);
    // if (!validateUsername.isSuccessful) {
    //   return DataFailed(
    //       errorMessage: validateUsername.error ??
    //           "Something went wrong with the username");



    } else {
      var result =
          await sl<UpdateUserProfileUseCase>().call(params: _userName.text);

      toggleEditingProfile();
      return result;
    }
  }

  Future<void> logOut() async => await sl<LogOutUseCase>().call();

  Future<DataState> deleteAccount() async {
    return DataFailed();
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitar/common/helpers/validation/validate_new_password.dart';
import 'package:habitar/features/auth/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:habitar/features/auth/presentation/bloc/sign_up/sign_up_state.dart';
import '../../../../../common/helpers/validation/validate_email.dart';
import '../../../../../core/res/data_state.dart';
import '../../../../../service_locator.dart';
import '../../../domain/entities/SignUpRequestEntity.dart';
import '../../../domain/usecases/signup.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  final SignUpUseCase _signupUseCase;

  SignUpBloc(this._signupUseCase) : super(const SignUpInit()) {
   on <InitSignUp> (initSignUp);
   on <TrySignUp> (onSignUp);
   on <UpdateShowPassword> (onUpdateShowPassword);
  }

  void initSignUp(InitSignUp event, Emitter<SignUpState> emit) async {
    emit(const SignUpInit());
  }

  void onSignUp(TrySignUp event, Emitter<SignUpState> emit) async {

    var validateEmail = sl<ValidateEmail>().execute(event.email);
    if (!validateEmail.isSuccessful){
      return emit(SignUpError(validateEmail.error ?? "Something went wrong with the email"));
    }

    var validatePassword = sl<ValidateNewPassword>().execute(event.password);
    if (!validatePassword.isSuccessful){
      return emit(SignUpError(validatePassword.error ?? "Something went wrong with the password"));
    }

    emit(const SignUpLoading());

    final dataState = await _signupUseCase.call(
        params: SignUpRequestEntity(
          name: event.name,
          email: event.email,
            password: event.password,
        )
    );

    if (dataState is DataFailed){
      emit(SignUpError(dataState.errorMessage ?? "Something went wrong"));
    } else {
      emit(const SignUpSuccess());
    }
  }

  void onUpdateShowPassword(UpdateShowPassword event, Emitter<SignUpState> emit) async {
    emit(ShowPasswordChanged(event.showPassword));
  }

}
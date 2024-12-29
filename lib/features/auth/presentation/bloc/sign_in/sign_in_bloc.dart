import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/form_validation.dart';
import 'package:habitar/common/helpers/validation/validate_email.dart';
import 'package:habitar/common/helpers/validation/validate_login_password.dart';
import 'package:habitar/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import '../../../../../core/res/data_state.dart';
import '../../../../../service_locator.dart';
import '../../../domain/entities/SignInRequestEntity.dart';
import '../../../domain/usecases/signin.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(const SignInInit()) {
   on <InitSignIn> (initSignIn);
   on <TrySignIn> (onSignIn);
   on <UpdateShowPassword> (onUpdateShowPassword);
  }

  void initSignIn(InitSignIn event, Emitter<SignInState> emit) async {
    emit(const SignInInit());
  }

  void onSignIn(TrySignIn event, Emitter<SignInState> emit) async {

    final emailValidator = Validator(
      validators: [
        const EmailValidator(),
        const RequiredValidator(),
      ],
    );
    var emailValidatorError = emailValidator.validate(
      label: 'Must be a valid email',
      value: event.email,
    );

    if (emailValidatorError != null){
      return emit(SignInError(emailValidatorError ?? "Something went wrong with the email"));
    }

    final passwordValidator = Validator(
      validators: [
        const MinLengthValidator(length: 1),
        const RequiredValidator(),
      ],
    );
    var passwordValidatorError = passwordValidator.validate(
      label: 'Password is required',
      value: event.password,
    );

    if (passwordValidatorError != null){
      return emit(SignInError(passwordValidatorError ?? "Something went wrong with the email"));
    }



    //Old version
    // var validateEmail = sl<ValidateEmail>().execute(event.email);
    // if (!validateEmail.isSuccessful){
    //   return emit(SignInError(validateEmail.error ?? "Something went wrong with the email"));
    // }
    //
    // var validatePassword = sl<ValidateLoginPassword>().execute(event.password);
    // if (!validatePassword.isSuccessful){
    //   return emit(SignInError(validatePassword.error ?? "Something went wrong with the password"));
    // }

    emit(const SignInLoading());

    final dataState = await _signInUseCase.call(
        params: SignInRequestEntity(
          email: event.email,
            password: event.password,
        )
    );

    if (dataState is DataFailed){
      emit(SignInError(dataState.errorMessage ?? "Something went wrong"));
    } else {
      emit(const SignInSuccess());
    }
  }

  void onUpdateShowPassword(UpdateShowPassword event, Emitter<SignInState> emit) async {
    emit(ShowPasswordChanged(event.showPassword));
  }

}
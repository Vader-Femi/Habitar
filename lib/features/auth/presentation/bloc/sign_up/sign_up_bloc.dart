import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapplication/core/res/data_state.dart';
import 'package:myapplication/features/auth/domain/entities/SignUpRequestEntity.dart';
import 'package:myapplication/features/auth/domain/usecases/signup.dart';
import 'package:myapplication/features/auth/presentation/bloc/sign_up/sign_up_event.dart';
import 'package:myapplication/features/auth/presentation/bloc/sign_up/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  final SignupUseCase _signupUseCase;

  SignUpBloc(this._signupUseCase) : super(const SignUpInit()) {
   on <InitSignUp> (initSignUp);
   on <TrySignUp> (onSignUp);
   on <UpdateShowPassword> (onUpdateShowPassword);
  }

  void initSignUp(InitSignUp event, Emitter<SignUpState> emit) async {
    emit(const SignUpInit());
  }

  void onSignUp(TrySignUp event, Emitter<SignUpState> emit) async {
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
      emit(const SignUpDone());
    }
  }

  void onUpdateShowPassword(UpdateShowPassword event, Emitter<SignUpState> emit) async {
    emit(ShowPasswordChanged(event.showPassword));
  }

}
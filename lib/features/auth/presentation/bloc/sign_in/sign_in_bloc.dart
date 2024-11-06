import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitar/features/auth/presentation/bloc/sign_in/sign_in_event.dart';
import '../../../../../core/res/data_state.dart';
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
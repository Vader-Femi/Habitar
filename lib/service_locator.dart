import 'package:get_it/get_it.dart';
import 'package:habitar/features/home/data/repository/home_repository_impl.dart';
import 'package:habitar/features/home/data/sources/home_service.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import 'package:habitar/features/home/domain/usecases/add_a_habit.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/data/sources/auth_service.dart';
import 'features/auth/domain/repository/auth.dart';
import 'features/auth/domain/usecases/signin.dart';
import 'features/auth/domain/usecases/signup.dart';
import 'features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'features/home/domain/usecases/get_habits.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  //Auth

  sl.registerSingleton<AuthService>(
    AuthServiceImpl()
  );
  
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(sl())
  );

  sl.registerSingleton<SignUpUseCase>(
    SignUpUseCase(sl())
  );

  sl.registerSingleton<SignInUseCase>(
    SignInUseCase(sl())
  );

  // Auth Bloc
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl()));

  sl.registerFactory<SignInBloc>(() => SignInBloc(sl()));


  //Home
  sl.registerSingleton<HomeService>(
      HomeServiceImpl()
  );

  sl.registerSingleton<HomeRepository>(
    HomeRepositoryImpl(sl())
  );

  sl.registerSingleton<AddAHabitUseCase>(
      AddAHabitUseCase(sl())
  );

  sl.registerSingleton<GetHabitsUseCase>(
      GetHabitsUseCase(sl())
  );

}
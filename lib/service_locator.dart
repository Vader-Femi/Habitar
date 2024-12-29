import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:habitar/common/helpers/validation/validate_email.dart';
import 'package:habitar/common/helpers/validation/validate_habit.dart';
import 'package:habitar/common/helpers/validation/validate_login_password.dart';
import 'package:habitar/common/helpers/validation/validate_new_password.dart';
import 'package:habitar/common/helpers/validation/validate_username.dart';
import 'package:habitar/features/home/data/db/habit_db.dart';
import 'package:habitar/features/home/data/notification/notification.dart';
import 'package:habitar/features/home/data/repository/home_repository_impl.dart';
import 'package:habitar/features/home/data/sources/home_service.dart';
import 'package:habitar/features/home/domain/repository/home.dart';
import 'package:habitar/features/home/domain/usecases/add_a_habit.dart';
import 'package:habitar/features/home/domain/usecases/get_user.dart';
import 'package:habitar/features/home/domain/usecases/tick_habits.dart';
import 'package:habitar/features/home/domain/usecases/update_habit.dart';
import 'core/usecase/is_user_logged_in.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/data/sources/auth_service.dart';
import 'features/auth/domain/repository/auth.dart';
import 'features/auth/domain/usecases/signin.dart';
import 'features/auth/domain/usecases/signup.dart';
import 'features/auth/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'features/home/data/db/habitDBHelper.dart';
import 'features/home/domain/usecases/add_habits_batch_to_db.dart';
import 'features/home/domain/usecases/add_habits_to_db.dart';
import 'features/home/domain/usecases/delete_account.dart';
import 'features/home/domain/usecases/delete_all_habits_in_db.dart';
import 'features/home/domain/usecases/delete_habit.dart';
import 'features/home/domain/usecases/delete_single_habit_from_db.dart';
import 'features/home/domain/usecases/get_habits_from_db.dart';
import 'features/home/domain/usecases/get_habits.dart';
import 'features/home/domain/usecases/get_single_habit_from_db.dart';
import 'features/home/domain/usecases/log_out.dart';
import 'features/home/domain/usecases/update_habit_in_db.dart';
import 'features/home/domain/usecases/update_user_profile.dart';
import 'features/home/domain/usecases/watch_habit_from_db.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<FirebaseAuth>( // I created this late that's why it's not being used everywhere
      FirebaseAuth.instance
  );

  sl.registerSingleton<IsUserLoggedIn>(
      IsUserLoggedIn()
  );

  sl.registerSingleton<NotificationService>(
    NotificationService()
  );

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
  sl.registerSingleton<HabitDb>(
      HabitDb()
  );

  sl.registerSingleton<HabitDBHelper>(
      HabitDBHelper(sl())
  );

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

  sl.registerSingleton<TickHabitsUseCase>(
      TickHabitsUseCase(sl())
  );

  sl.registerSingleton<DeleteHabitUseCase>(
      DeleteHabitUseCase(sl())
  );

  sl.registerSingleton<UpdateHabitUseCase>(
      UpdateHabitUseCase(sl())
  );

  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase(sl())
  );

  sl.registerSingleton<UpdateUserProfileUseCase>(
      UpdateUserProfileUseCase(sl())
  );

  sl.registerSingleton<AddHabitsBatchToDBUseCase>(
      AddHabitsBatchToDBUseCase(sl())
  );

  sl.registerSingleton<AddHabitsToDBUseCase>(
      AddHabitsToDBUseCase(sl())
  );

  sl.registerSingleton<GetHabitsFromDBUseCase>(
      GetHabitsFromDBUseCase(sl())
  );

  sl.registerSingleton<GetSingleHabitFromDBUseCase>(
      GetSingleHabitFromDBUseCase(sl())
  );

  sl.registerSingleton<WatchHabitsFromDBUseCase>(
      WatchHabitsFromDBUseCase(sl())
  );

  sl.registerSingleton<DeleteSingleHabitFromDbUseCase>(
      DeleteSingleHabitFromDbUseCase(sl())
  );

  sl.registerSingleton<DeleteAllHabitsInDBUseCase>(
      DeleteAllHabitsInDBUseCase(sl())
  );

  sl.registerSingleton<UpdateHabitInDbUseCase>(
      UpdateHabitInDbUseCase(sl())
  );

  sl.registerSingleton<LogOutUseCase>(
      LogOutUseCase(sl())
  );

  sl.registerSingleton<DeleteAccountUseCase>(
      DeleteAccountUseCase(sl())
  );

  sl.registerSingleton<ValidateEmail>(
      ValidateEmail()
  );

  sl.registerSingleton<ValidateHabit>(
      ValidateHabit()
  );

  sl.registerSingleton<ValidateLoginPassword>(
      ValidateLoginPassword()
  );

  sl.registerSingleton<ValidateNewPassword>(
      ValidateNewPassword()
  );

  sl.registerSingleton<ValidateUsername>(
      ValidateUsername()
  );

}
import 'package:get_it/get_it.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/data/sources/auth_service.dart';
import 'features/auth/domain/repository/auth.dart';
import 'features/auth/domain/usecases/signin.dart';
import 'features/auth/domain/usecases/signup.dart';
import 'features/auth/presentation/bloc/sign_up/sign_up_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

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

  // Bloc
  sl.registerFactory<SignUpBloc>(() => SignUpBloc(sl()));
}
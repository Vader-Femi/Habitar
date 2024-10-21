import 'package:get_it/get_it.dart';
import 'package:myapplication/features/auth/data/repository/auth_repository_impl.dart';
import 'package:myapplication/features/auth/domain/repository/auth.dart';
import 'package:myapplication/features/auth/domain/usecases/signin.dart';
import 'package:myapplication/features/auth/domain/usecases/signup.dart';

import 'features/auth/data/sources/auth_service.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthService>(
    AuthServiceImpl()
  );
  
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(sl())
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(sl())
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(sl())
  );
}
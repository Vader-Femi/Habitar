import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/pages/home_page.dart';
import 'package:habitar/service_locator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'config/routes/AppRoutes.dart';
import 'config/theme/AppTheme.dart';
import 'core/usecase/is_user_logged_in.dart';
import 'features/choose_mode/presentation/bloc/theme_cubit.dart';
import 'features/splash/presentation/pages/splash.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );

  await initializeDependencies();


  runApp(const SuperApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (BuildContext context, ThemeMode mode) => MaterialApp(
          title: 'Habitar',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HomePage(),
          // home: const SplashPage(),
        ),
      ),
    );
  }
}
//
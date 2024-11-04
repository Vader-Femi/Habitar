import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitar/service_locator.dart';
import 'config/routes/AppRoutes.dart';
import 'config/theme/AppTheme.dart';
import 'features/choose_mode/presentation/bloc/theme_cubit.dart';
import 'features/splash/presentation/pages/splash.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // HydratedBloc.storage = await HydratedStorage.build(
  //     storageDirectory: kIsWeb
  //         ? HydratedStorage.webStorageDirectory
  //         : await getTemporaryDirectory(),
  // );

  await initializeDependencies();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (BuildContext context, ThemeMode mode) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
          // darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const SplashPage(),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:myapplication/config/theme/AppTheme.dart';
import 'package:myapplication/features/choose_mode/presentation/bloc/theme_cubit.dart';
import 'package:myapplication/features/splash/presentation/pages/splash.dart';
import 'package:path_provider/path_provider.dart';
import 'package:myapplication/service_locator.dart';
import 'config/routes/AppRoutes.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
  );

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
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const SplashPage(),
        ),
      ),
    );
  }
}

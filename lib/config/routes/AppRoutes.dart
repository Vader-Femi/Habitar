import 'package:flutter/material.dart';
import 'package:myapplication/features/auth/presentation/pages/add_a_habit.dart';
import 'package:myapplication/features/home/presentation/pages/home_page.dart';
import 'package:myapplication/features/splash/presentation/pages/splash.dart';
import '../../features/auth/presentation/pages/get_started.dart';
import '../../features/auth/presentation/pages/signin.dart';
import '../../features/auth/presentation/pages/signup.dart';


class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const SplashPage());

      case '/GetStarted':
        return _materialRoute(const GetStartedPage());

      case '/SignIn':
        return _materialRoute(SignIn());

      case '/SignUp':
        return _materialRoute(SignUp());

      case '/AddFirstHabit':
        return _materialRoute(const AddAHabit());

      case '/Home':
        return _materialRoute(const HomePage());
        
      default:
        return _materialRoute(const SplashPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
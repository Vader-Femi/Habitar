import 'package:flutter/material.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/presentation/pages/update_habit_page.dart';
import '../../features/auth/presentation/pages/all_set.dart';
import '../../features/auth/presentation/pages/get_started.dart';
import '../../features/auth/presentation/pages/signin.dart';
import '../../features/auth/presentation/pages/signup.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/splash/presentation/pages/splash.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const SplashPage());

      case '/GetStarted':
        return _materialRoute(const GetStartedPage());

      case '/SignUp':
        return _materialRoute(SignUp());

      case '/AllSet':
        return _materialRoute(const AllSet());

      case '/SignIn':
        return _materialRoute(SignIn());

      case '/Home':
        return _materialRoute(const HomePage());

      case '/UpdateHabit':
        var oldHabit = settings.arguments as HabitEntity;
        return _materialRoute(UpdateHabitPage(oldHabit: oldHabit));
        
      default:
        return _materialRoute(const GetStartedPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
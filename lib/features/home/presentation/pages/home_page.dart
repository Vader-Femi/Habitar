import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/pages/add_a_habit_tab.dart';
import 'package:habitar/features/home/presentation/pages/habits_tab.dart';
import 'package:habitar/features/home/presentation/state/get_habits_viewmodel.dart';
import 'package:habitar/features/home/presentation/widgets/add_new_habit_app_bar.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 30),
        child: HabitsTab(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habitar/features/home/presentation/pages/add_a_habit.dart';
import 'package:habitar/features/home/presentation/widgets/add_new_habit_app_bar.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddNewHabitAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 30),
        child: AddAHabit(),
      ),
    );
  }
}

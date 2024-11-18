import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import '../state/today_habits_viewmodel.dart';
import '../widgets/single_add_new_habit.dart';
import '../widgets/single_today_habit.dart';

class TodayHabitsTab extends StatefulWidget {
  const TodayHabitsTab({super.key});

  @override
  State<TodayHabitsTab> createState() => _TodayHabitsTabState();
}

class _TodayHabitsTabState extends State<TodayHabitsTab> {
  @override
  void initState() {
    super.initState();
    todayHabitsViewModel.getTodayHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 0),
      child: SuperBuilder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Today, I have:",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                letterSpacing: 1,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: todayHabitsViewModel.habits.length,
              itemBuilder: (context, index) {
                return SingleTodayHabit(
                  todayHabitEntity: todayHabitsViewModel.habits[index],
                  index: index,
                );
              },
            ),
            SizedBox(height: 13),
            SingleAddNewHabit(),
          ],
        ),
      ),
    );
  }
}

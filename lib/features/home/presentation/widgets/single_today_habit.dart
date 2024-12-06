import 'package:flutter/material.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import '../state/today_habits_viewmodel.dart';

class SingleTodayHabit extends StatelessWidget {
  const SingleTodayHabit(
      {super.key, required this.todayHabitEntity, required this.index});

  final TodayHabitEntity todayHabitEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Text(todayHabitEntity.habit.habit)),
        Checkbox(
          value: todayHabitEntity.isSelected,
          activeColor: Theme.of(context).colorScheme.surfaceContainer,
          checkColor: Theme.of(context).colorScheme.onSurface,
          fillColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surfaceContainer,),
          onChanged: (isChecked) {
            todayHabitsViewModel.tickHabit(
              habit: todayHabitEntity,
              isTicked: isChecked ?? false,
            );
          },
        ),
      ],
    );
  }
}

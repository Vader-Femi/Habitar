import 'package:flutter/material.dart';
import 'package:habitar/config/theme/app_colors.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import 'package:habitar/features/home/presentation/state/get_habits_viewmodel.dart';
import '../../domain/entities/habit_entity.dart';

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
        Expanded(child: Text(todayHabitEntity.habit)),
        Checkbox(
          value: todayHabitEntity.isSelected,
          activeColor: Theme.of(context).colorScheme.surfaceContainer,
          checkColor: Theme.of(context).colorScheme.onSurface,
          fillColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surfaceContainer,),
          onChanged: (isChecked) {
            getHabitsViewModel.tickHabit(
              habit: todayHabitEntity,
              index: index,
              isTicked: isChecked ?? false,
            );
          },
        ),
      ],
    );
  }
}

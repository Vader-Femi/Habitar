import 'package:flutter/material.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import 'package:habitar/features/notification/notification.dart';
import '../../../../service_locator.dart';
import '../state/home_viewmodel.dart';
import '../state/today_habits_viewmodel.dart';

class SingleTodayHabit extends StatelessWidget {
  const SingleTodayHabit(
      {super.key, required this.todayHabitEntity, required this.index});

  final TodayHabitEntity todayHabitEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/UpdateHabit",arguments: todayHabitEntity.habit),
      child: Row(
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
              // sl<NotificationService>().showInstantNotification(habit: getHomeViewModel.habits[0]);
              todayHabitsViewModel.tickHabit(
                habit: todayHabitEntity,
                isTicked: isChecked ?? false,
              );
            },
          ),
        ],
      ),
    );
  }
}

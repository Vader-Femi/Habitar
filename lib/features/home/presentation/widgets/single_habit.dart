import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitar/core/assets/app_vectors.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import '../../domain/entities/habit_entity.dart';

class SingleHabit extends StatelessWidget {
  const SingleHabit(
      {super.key,
      required this.habitEntity,
      required this.timeOfDay,
      required this.dayOfWeek});

  final HabitEntity habitEntity;
  final String timeOfDay;
  final String dayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 5, 3, 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/UpdateHabit",arguments: habitEntity),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        habitEntity.habit,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            habitEntity.streak,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.surfaceTint),
                          ),
                          SizedBox(width: 1),
                          SvgPicture.asset(AppVectors.appLogo, height: 15, width: 15,),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Flexible(
                  child: Text(
                    timeOfDay,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceTint),
                  ),
                ),
                const SizedBox(height: 15),
                Flexible(
                  child: Text(
                    dayOfWeek,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.surfaceTint),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

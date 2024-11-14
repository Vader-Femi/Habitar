import 'package:flutter/material.dart';
import '../../domain/entities/habit_entity.dart';

class SingleHabit extends StatelessWidget {
  const SingleHabit({super.key, required this.habitEntity});

  final HabitEntity habitEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(habitEntity.habit),
        SizedBox(
          height: 20,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: habitEntity.selectedPeriodicity.length,
            itemBuilder: (context, periodIndex) {
              return Text(
                "${habitEntity.selectedPeriodicity[periodIndex]} ",
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: habitEntity.selectedTimeOfDay.length,
            itemBuilder: (context, timeIndex) {
              return Text(
                "${habitEntity.selectedTimeOfDay[timeIndex]} ",
              );
            },
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

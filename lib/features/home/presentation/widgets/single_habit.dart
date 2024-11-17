import 'package:flutter/material.dart';
import '../../domain/entities/habit_entity.dart';

class SingleHabit extends StatelessWidget {
  const SingleHabit({super.key, required this.habitEntity});

  final HabitEntity habitEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(3, 5, 3, 10),
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
              Text(habitEntity.habit, style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
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
            ],
          ),
        ),
      ),
    );
  }
}

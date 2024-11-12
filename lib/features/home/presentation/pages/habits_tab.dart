import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/state/get_habits_viewmodel.dart';
import '../widgets/home_app_bar.dart';

class HabitsTab extends StatefulWidget {
  const HabitsTab({super.key});

  @override
  State<HabitsTab> createState() => _HabitsTabState();
}

class _HabitsTabState extends State<HabitsTab> {
  @override
  void initState() {
    super.initState();
    getHabitsViewModel.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return SuperBuilder(
      builder: (context) => ListView.builder(
        shrinkWrap: true,
        itemCount: getHabitsViewModel.habits.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(getHabitsViewModel.habits[index].habit),
              SizedBox(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: getHabitsViewModel
                      .habits[index].selectedPeriodicity.length,
                  itemBuilder: (context, periodIndex) {
                    return Text(
                        "${getHabitsViewModel.habits[index].selectedPeriodicity[periodIndex]} ");
                  },
                ),
              ),
              SizedBox(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: getHabitsViewModel
                      .habits[index].selectedTimeOfDay.length,
                  itemBuilder: (context, timeIndex) {
                    return Text("${getHabitsViewModel
                        .habits[index].selectedTimeOfDay[timeIndex]} ");
                  },
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../state/profile_viewmodel.dart';
import '../widgets/profile_info.dart';
import '../widgets/single_habit.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    super.initState();
    getHomeViewModel.getUser();
    getProfileViewModel.getHabits();
  }

  @override
  Widget build(BuildContext context) {
    return SuperBuilder(
      builder: (context) => ListView(
        children: [
          ProfileInfo(userEntity: getHomeViewModel.user.state),  //Todo fix not updating
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            child: Text(
              "All Habits",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 13),
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: getHomeViewModel.habits.length,
              itemBuilder: (context, index) {
                var habitEntity = getHomeViewModel.habits[index];
                var timeOfDay = "";
                var dayOfWeek = "";
                for (var time in habitEntity.selectedTimeOfDay) {
                  timeOfDay +=
                      "$time${time == habitEntity.selectedTimeOfDay.last ? "" : ", "}";
                }
                for (var day in habitEntity.selectedPeriodicity) {
                  dayOfWeek +=
                      "$day${day == habitEntity.selectedPeriodicity.last ? "" : ", "}";
                }
                return SingleHabit(
                  habitEntity: habitEntity,
                  timeOfDay: timeOfDay,
                  dayOfWeek: dayOfWeek,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

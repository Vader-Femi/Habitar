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
    return Padding(
      padding:
        const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileInfo(),
            const SizedBox(height: 19),
            Text(
              "All Habits",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 17),
            SuperBuilder(
              builder: (context) => ListView.builder(
                shrinkWrap: true,
                itemCount: getProfileViewModel.habits.length,
                itemBuilder: (context, index) {
                  return SingleHabit(
                    habitEntity: getProfileViewModel.habits[index],
                  );
                },
              ),
            ),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}

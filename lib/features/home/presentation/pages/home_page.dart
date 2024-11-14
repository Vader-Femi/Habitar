import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/config/theme/app_colors.dart';
import 'package:habitar/features/home/presentation/pages/add_a_habit_tab.dart';
import 'package:habitar/features/home/presentation/pages/today_habits_tab.dart';
import 'package:habitar/features/home/presentation/widgets/add_new_habit_app_bar.dart';
import '../state/home_viewmodel.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    getHomeViewModel.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SuperBuilder(
      builder: (context) => Scaffold(
        appBar: switch (getHomeViewModel.selectedTabIndex.state) {
          0 => HomeAppbar(),
          1 => AddNewHabitAppbar(),
          _ => HomeAppbar(),
        },
        body: Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 20),
          child: switch (getHomeViewModel.selectedTabIndex.state) {
            0 => TodayHabitsTab(),
            1 => AddAHabitTab(),
            _ => TodayHabitsTab(),
          },
        ),
        bottomNavigationBar: getHomeViewModel.selectedTabIndex.state == 1
            ? null
            : NavigationBar(
                selectedIndex: getHomeViewModel.selectedTabIndex.state,
                onDestinationSelected: (index) =>
                    getHomeViewModel.selectTabAtIndex(index),
                height: 88,
                indicatorColor: AppColours.primaryUnfocused,
                // unselectedFontSize: 14,
                // selectedFontSize: 14,
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
                // iconSize: 28,
                elevation: 0,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                    selectedIcon: Icon(Icons.home_outlined),
                  ),
                  NavigationDestination(
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Icon(
                        Icons.add_circle_rounded,
                        color: AppColours.primary,
                        size: 40,
                      ),
                    ),
                    label: '',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.perm_identity_outlined),
                    label: 'Profile',
                    selectedIcon: Icon(Icons.perm_identity_outlined),
                  ),
                ],
              ),
      ),
    );
  }
}

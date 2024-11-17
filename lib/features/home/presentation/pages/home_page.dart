import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/pages/add_a_habit_tab.dart';
import 'package:habitar/features/home/presentation/pages/profile_tab.dart';
import 'package:habitar/features/home/presentation/pages/today_habits_tab.dart';
import 'package:habitar/features/home/presentation/widgets/add_new_habit_app_bar.dart';
import '../state/home_viewmodel.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/profile_app_bar.dart';

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
          2 => ProfileAppBar(),
          _ => HomeAppbar(),
        },
        body: switch (getHomeViewModel.selectedTabIndex.state) {
          0 => TodayHabitsTab(),
          1 => AddAHabitTab(),
          2 => ProfileTab(),
          _ => TodayHabitsTab(),
        },
        bottomNavigationBar: NavigationBar(
                selectedIndex: getHomeViewModel.selectedTabIndex.state,
                onDestinationSelected: (index) =>
                    getHomeViewModel.selectTabAtIndex(index),
                height: 100,
                // indicatorColor: AppColours.primaryUnfocused,
                // unselectedFontSize: 14,
                // selectedFontSize: 14,
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
                // iconSize: 28,
                elevation: 15,
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                    selectedIcon: Icon(Icons.home_outlined),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.add),
                    label: 'Add',
                    selectedIcon: Icon(Icons.add),
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

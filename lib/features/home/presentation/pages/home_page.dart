import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habitar/core/assets/app_vectors.dart';
import 'package:habitar/features/home/presentation/pages/add_a_habit_tab.dart';
import 'package:habitar/features/home/presentation/pages/profile_tab.dart';
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
          // 2 => ProfileAppBar(),
          _ => null, //HomeAppbar(),
        },
        body: switch (getHomeViewModel.selectedTabIndex.state) {
          0 => TodayHabitsTab(),
          1 => AddAHabitTab(),
          2 => ProfileTab(),
          _ => TodayHabitsTab(),
        },
        bottomNavigationBar: getHomeViewModel.selectedTabIndex.state == 1
            ? null
            : Container(
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: NavigationBar(
                    selectedIndex: getHomeViewModel.selectedTabIndex.state,
                    onDestinationSelected: (index) =>
                        getHomeViewModel.selectTabAtIndex(index),
                    height: 70,
                    // height: 88,
                    // indicatorColor: AppColours.primaryUnfocused,
                    // unselectedFontSize: 14,
                    // selectedFontSize: 14,
                    // showSelectedLabels: false,
                    // showUnselectedLabels: false,
                    // iconSize: 28,
                    elevation: 15,
                    destinations: [
                      NavigationDestination(
                          icon: Icon(Icons.home_outlined, size: 26),
                          label: 'Home'),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.5),
                        // child: Container(
                        // transform: Matrix4.translationValues(0, -23, 0),
                        child: NavigationDestination(
                          icon: SvgPicture.asset(
                            AppVectors.addSquare,
                            width: 42,
                            height: 42,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.surfaceTint,
                              BlendMode.srcIn,
                            ),
                          ),
                          label: '',
                        ),
                        // ),
                      ),
                      NavigationDestination(
                          icon: Icon(Icons.perm_identity_outlined, size: 26),
                          label: 'Profile'),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

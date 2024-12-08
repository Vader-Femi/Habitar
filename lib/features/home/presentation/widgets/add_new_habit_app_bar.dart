import 'package:flutter/material.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/constants/constants.dart';
import 'app_bar_shape.dart';

class AddNewHabitAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AddNewHabitAppbar({super.key});

  final double toolbarHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Constants.topWidgetTag,
      child: AppBar(
        elevation: 30,
        centerTitle: false,
        toolbarHeight: toolbarHeight,
        shape: AppBarShape(),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add new habit",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Satoshi",
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => getHomeViewModel.selectTabAtIndex(0),
                child: Icon(
                  Icons.cancel,
                  size: 28,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        leading: null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight); //kTextTabBarHeight);
}

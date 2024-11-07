import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/constants/constants.dart';

class AddNewHabitAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AddNewHabitAppbar({super.key});

  final double toolbarHeight = 68.0;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Constants.appBarHeroTag,
      child: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: toolbarHeight,
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
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Icon(
                  Icons.cancel,
                  size: 28,
                  color: Colors.white,
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

import 'package:flutter/material.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/constants/constants.dart';
import 'app_bar_shape.dart';

class UpdateHabitAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdateHabitAppBar({super.key});

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
        title: Text(
          "Update habit",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Satoshi",
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight); //kTextTabBarHeight);
}

import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import 'app_bar_shape.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  final double toolbarHeight = 90.0;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Constants.appBarHeroTag,
      child: AppBar(
        elevation: 30,
        centerTitle: false,
        toolbarHeight: toolbarHeight,
        shape: AppBarShape(),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Satoshi",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: null,
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight); //kTextTabBarHeight);
}

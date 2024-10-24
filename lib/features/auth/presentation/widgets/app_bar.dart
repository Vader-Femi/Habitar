import 'package:flutter/material.dart';
import 'package:myapplication/common/helpers/is_light_mode.dart';
import 'package:myapplication/config/theme/app_colors.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int pageNumber;
  final double toolbarHeight = 68.0;

  const AuthAppbar({super.key, required this.pageNumber});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Appbar",
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: toolbarHeight,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "$pageNumber/4",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                value: pageNumber / 4,
                borderRadius: BorderRadius.circular(7),
                backgroundColor: AppColours.primaryUnfocused,
                minHeight: 8,

              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        leading: null,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight); //kTextTabBarHeight);
}

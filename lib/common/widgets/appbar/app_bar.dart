import 'package:flutter/material.dart';
import 'package:myapplication/common/helpers/is_light_mode.dart';
import 'package:myapplication/config/theme/app_colors.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? action;
  final bool showBackButton;
  final Color? backgroundColour;

  const BasicAppbar({super.key, this.showBackButton = true, this.title, this.backgroundColour, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColour ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(""),
      actions: [
        action ?? Container()
      ],
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Container(
                decoration: BoxDecoration(
                    color: context.isLightMode
                        ? AppColours.backButtonContainerLight
                        : AppColours.backButtonContainerDark,
                    shape: BoxShape.circle),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isLightMode
                      ? AppColours.backButtonLight
                      : AppColours.backButtonDark,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}

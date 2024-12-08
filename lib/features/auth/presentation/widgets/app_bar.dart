import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/app_bar_shape.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double toolbarHeight = 90;
  final VoidCallback goBack;

  const AuthAppbar({super.key, required this.title, required this.goBack});

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
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => goBack(),
          icon: Icon(
            Icons.arrow_back,
            size: 18,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight); //kTextTabBarHeight);
}

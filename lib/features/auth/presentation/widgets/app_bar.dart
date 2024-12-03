import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int pageNumber;
  final double toolbarHeight = 90;
  final VoidCallback goBack;

  const AuthAppbar({super.key, required this.pageNumber, required this.goBack});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Constants.appBarHeroTag,
      child: AppBar(
        elevation: 30,
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
                    onPressed: goBack,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  Text(
                    "$pageNumber/4",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Satoshi",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primaryContainer,
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
                backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                color: Theme.of(context).colorScheme.primaryContainer,
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

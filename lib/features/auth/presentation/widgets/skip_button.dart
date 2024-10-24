import 'package:flutter/material.dart';

Widget skipButton(BuildContext context) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      elevation: 5,
    ),
    child: Text(
      "Skip",
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
    ),
  );
}

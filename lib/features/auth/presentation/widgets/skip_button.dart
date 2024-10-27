import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class SkipButton extends StatelessWidget {

  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Constants.skipButtonHeroTag,
      child: OutlinedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, "/AllSet"),
        style: OutlinedButton.styleFrom(
          elevation: 5,
        ),
        child: Text(
          "Skip",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}

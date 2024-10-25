import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onClick;

  const SkipButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: Constants.skipButtonHeroTag,
      child: OutlinedButton(
        onPressed: onClick,
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

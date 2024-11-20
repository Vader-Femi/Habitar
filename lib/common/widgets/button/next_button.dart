import 'package:flutter/material.dart';
import 'basic_app_button.dart';
import '../../../core/constants/constants.dart';

class NextButton extends StatelessWidget {

  final String title;
  final VoidCallback onClick;

  const NextButton({super.key, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return  Hero(
      tag: Constants.nextButtonHeroTag,
      child: BasicAppButton(
        onPressed: onClick,
        title: title,
      ),
    );
  }
}

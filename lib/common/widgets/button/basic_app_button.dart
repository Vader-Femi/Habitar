import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const BasicAppButton(
      {super.key,
      required this.onPressed,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 8,
      ),
      child: Text(
        title,
      ),
    );
  }
}

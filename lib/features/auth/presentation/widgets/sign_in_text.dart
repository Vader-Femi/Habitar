import 'package:flutter/material.dart';

Widget signinText(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Already Have An Account?",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/SignIn');
          },
          child: Text(
            "Sign in",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary,
            ),
          ))
    ],
  );
}
import 'package:flutter/material.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../state/profile_viewmodel.dart';

void showLogOutAlertDialog(BuildContext context) {
  final String title = "Log Out";
  final String message = "Are you sure you want to log out?";
  final String positiveBtnText = "Yes";
  final String negativeBtnText = "Not yet";

  // set up the AlertDialog
  var dialog = AlertDialog(
    title: Text(title),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        SizedBox(height: 30),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () async {
                  await getProfileViewModel.logOut();
                  Navigator.pushReplacementNamed(context, '/GetStarted');
                },
                style: OutlinedButton.styleFrom(
                  elevation: 5,
                ),
                child: Text(
                  positiveBtnText,
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                ),
                child: Text(
                  negativeBtnText,
                ),
              ),
            ),
          ],
        )
      ],
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return dialog;
    },
  );
}

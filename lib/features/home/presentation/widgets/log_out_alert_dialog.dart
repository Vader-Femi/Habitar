import 'package:flutter/material.dart';
import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../../../../core/constants/constants.dart';
import '../state/profile_viewmodel.dart';

class LogOutAlertDialog extends StatelessWidget {
  final String title = "Log Out";
  final String message = "Are you sure you want to log out?";
  final String positiveBtnText = "Yes";
  final String negativeBtnText = "Not yet";

  const LogOutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      actions: [
        OutlinedButton(
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
        SizedBox(height: 5),
        NextButton(
          title: negativeBtnText,
          onClick: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

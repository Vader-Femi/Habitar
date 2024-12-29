import 'package:flutter/material.dart';
import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../../../../core/constants/constants.dart';
import '../state/profile_viewmodel.dart';

class DeleteAccountAlertDialog extends StatelessWidget {
  final String title = "Warning";
  final String message = "Are you sure you want to delete your account?\nNote: There is no going back after this";
  final String positiveBtnText = "Yes, delete it";
  final String negativeBtnText = "Not yet";

  const DeleteAccountAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      actions: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () async {
                    await getProfileViewModel.deleteAccount();
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
                child: NextButton(
                  title: negativeBtnText,
                  onClick: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

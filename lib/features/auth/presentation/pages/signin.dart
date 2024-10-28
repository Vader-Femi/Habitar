import 'package:flutter/material.dart';
import 'package:myapplication/features/auth/domain/usecases/SignIn.dart';
import 'package:myapplication/service_locator.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/app_bar.dart';
import '../widgets/next_button.dart';
import '../widgets/sign_in_text.dart';
import '../widgets/skip_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: _headingText(context),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/GetStarted", (r) => false),
          icon: Icon(
            Icons.arrow_back,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:30, top: 30, right: 30),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _emailField(context),
                  const SizedBox(height: 45),
                  _passwordField(context),
                  const SizedBox(height: 45),
                ],
              ),
            ),
            // const Spacer(),
            const SizedBox(height: 5),
            NextButton(
              title: "Log In",
              onClick: () async {
                var result = await sl<SigninUseCase>().call(params: "Name");
                result.fold(
                  (l) {
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  (r) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/Home", (r) => false);
                  },
                );
              },
            ),
            const SizedBox(height: 5),
            _resetPasswordTest(),
          ],
        ),
      ),
    );
  }

  Widget _headingText(BuildContext context) {
    return Text(
      "Welcome Back",
      textAlign: TextAlign.start,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: 1,
          color: Theme.of(context).primaryColor
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "What is your email address?",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColours.primaryUnfocused),
        ),
      ),
      controller: _email,
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "What your password?",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColours.primaryUnfocused),
        ),
      ),
      controller: _password,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  Widget _resetPasswordTest() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Forgotten your password?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              "Reset it",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Theme.of(context).colorScheme.primary,
              ),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:myapplication/features/auth/domain/usecases/signup.dart';
import 'package:myapplication/service_locator.dart';
import '../../../../config/theme/app_colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/next_button.dart';
import '../widgets/sign_in_text.dart';
import '../widgets/skip_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(pageNumber: 1, goBack: () {
        Navigator.pop(context);
      },),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _fullNameField(context),
                  const SizedBox(height: 45),
                  _emailField(context),
                  const SizedBox(height: 45),
                  _passwordField(context),
                  const SizedBox(height: 45),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: SkipButton(),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: NextButton(
                    title: "Proceed",
                    onClick: () async {
                      var result =
                          await sl<SignupUseCase>().call(params: "Name");
                      result.fold(
                        (l) {
                          var snackbar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        },
                        (r) {
                          Navigator.pushNamed(context, '/AddFirstHabit');
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const SignInText(),
          ],
        ),
      ),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Firstly, what is your firstname?",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColours.primaryUnfocused),
        ),
      ),
      controller: _name,
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
        hintText: "What is your desired password?",
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
}

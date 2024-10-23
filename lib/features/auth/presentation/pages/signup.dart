import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapplication/common/widgets/appbar/app_bar.dart';
import 'package:myapplication/common/widgets/button/basic_app_button.dart';
import 'package:myapplication/core/assets/app_vectors.dart';
import 'package:myapplication/features/auth/domain/usecases/signup.dart';
import 'package:myapplication/features/auth/presentation/pages/signin.dart';
import 'package:myapplication/features/home/presentation/pages/home_page.dart';
import 'package:myapplication/service_locator.dart';

import '../../../../config/theme/app_colors.dart';
import '../widgets/app_bar.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(pageNumber: 1),
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
                Expanded(
                  child: Hero(
                    tag: "Skip Button",
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        elevation: 5,
                      ),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Hero(
                    tag: "Next Button",
                    child: BasicAppButton(
                      onPressed: () async {
                        var result =
                            await sl<SignupUseCase>().call(params: "Name");

                        result.fold((l) {
                          var snackbar = SnackBar(content: Text(l));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }, (r) {
                          Navigator.pushNamed(context, '/Home');
                        });
                      },
                      title: "Proceed",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            _signinText(context),
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

  Widget _signinText(BuildContext context) {
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
}

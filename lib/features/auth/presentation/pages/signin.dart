import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapplication/common/widgets/appbar/app_bar.dart';
import 'package:myapplication/common/widgets/button/basic_app_button.dart';
import 'package:myapplication/core/assets/app_vectors.dart';
import 'package:myapplication/features/auth/domain/usecases/signin.dart';
import 'package:myapplication/features/auth/presentation/pages/signup.dart';
import 'package:myapplication/features/home/presentation/pages/home_page.dart';
import 'package:myapplication/service_locator.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.appLogo,
          height: 40,
          width: 40,
        ),
      ),
      bottomNavigationBar: null,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _signinText(),
            const SizedBox(height: 5),
            _supportText(),
            const SizedBox(height: 26),
            _emailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            _recoverPasswordButton(context),
            const SizedBox(height: 13),
            Hero(
              tag: "Next Button",
              child: BasicAppButton(
                onPressed: () async {

                  var result = await sl<SigninUseCase>().call(
                      params: ""
                      );

                  result.fold((l) {
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (r) {
                    Navigator.pushNamed(context, '/Home');
                  });

                },
                title: "Sign in",
              ),
            ),
            const SizedBox(height: 5),
            _registerText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _supportText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "If you need any support",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "click here",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff38B432),
              ),
            ))
      ],
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: "Enter Email"),
      controller: _email,
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: "Password"),
      controller: _password,
    );
  }

  Widget _recoverPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recover password",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget _registerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Not A Member ?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              child: const Text(
                "Register Now",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff288CE9),
                ),
              ))
        ],
      ),
    );
  }
}

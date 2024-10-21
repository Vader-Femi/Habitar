import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapplication/common/widgets/appbar/app_bar.dart';
import 'package:myapplication/common/widgets/button/basic_app_button.dart';
import 'package:myapplication/core/assets/app_vectors.dart';
import 'package:myapplication/features/auth/domain/usecases/signup.dart';
import 'package:myapplication/features/auth/presentation/pages/signin.dart';
import 'package:myapplication/features/home/presentation/pages/home_page.dart';
import 'package:myapplication/service_locator.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController _fullName = TextEditingController();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _registerText(),
            const SizedBox(height: 5),
            _supportText(),
            const SizedBox(height: 26),
            _fullNameField(context),
            const SizedBox(height: 16),
            _emailField(context),
            const SizedBox(height: 16),
            _passwordField(context),
            const SizedBox(height: 33),
            Hero(
              tag: "Next Button",
              child: BasicAppButton(
                onPressed: () async {
                  var result = await sl<SignupUseCase>().call(
                      params: "Name"
                  );

                  result.fold((l) {
                    var snackbar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (r) {
                    Navigator.pushNamed(context, '/Home');
                  });
                },
                title: "Create Password",
              ),
            ),
            const SizedBox(height: 5),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
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

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(hintText: "Full Name"),
      controller: _fullName,
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

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Do You Have An Account?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignIn');
              },
              child: const Text(
                "Sign in",
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

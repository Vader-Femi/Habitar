import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator.dart';
import '../bloc/sign_in/sign_in_bloc.dart';
import '../bloc/sign_in/sign_in_event.dart';
import '../bloc/sign_in/sign_in_state.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../widgets/app_bar.dart';

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
    return BlocProvider(
      create: (_) => sl<SignInBloc>()..add(const InitSignIn()),
      child: Scaffold(
        appBar: AuthAppbar(
          title: "Welcome Back",
          goBack: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
          child:
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
            if (state is SignInLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is SignInInit) {
              return _buildBody(context, state);
            }

            if (state is SignInSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/Home", (r) => false);
              });

              return _buildBody(context, state);
            }

            if (state is ShowPasswordChanged) {
              return _buildBody(context, state);
            }

            if (state is SignInError) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Error : ${state.errorMessage}"),
                ));
              });

              return _buildBody(context, state);
            }

            return _buildBody(context, state);
          }),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, SignInState state) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _emailField(context),
              const SizedBox(height: 45),
              _passwordField(context, state),
              const SizedBox(height: 45),
            ],
          ),
        ),
        // const Spacer(),
        const SizedBox(height: 5),
        NextButton(
          title: "Log In",
          onClick: () async {
            BlocProvider.of<SignInBloc>(context)
                .add(TrySignIn(email: _email.text, password: _password.text));
          },
        ),
        const SizedBox(height: 5),
        _resetPasswordTest(),
      ],
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "What is your email address?",
      ),
      controller: _email,
    );
  }

  Widget _passwordField(BuildContext context, SignInState state) {
    var showPassword = state.showPassword;

    return TextField(
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SignInBloc>(context).add(
              UpdateShowPassword(!showPassword),
            );
          },
          icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      controller: _password,
      keyboardType: TextInputType.visiblePassword,
      obscureText: showPassword,
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

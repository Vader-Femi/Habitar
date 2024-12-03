import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../service_locator.dart';
import '../bloc/sign_in/sign_in_bloc.dart';
import '../bloc/sign_in/sign_in_event.dart';
import '../bloc/sign_in/sign_in_state.dart';
import '../../../../common/widgets/button/next_button.dart';

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
      create: (_) =>
      sl<SignInBloc>()
        ..add(const InitSignIn()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 30,
          centerTitle: false,
          title: _headingText(context),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, "/GetStarted", (r) => false),
            icon: Icon(
              Icons.arrow_back,
              size: 18,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
          child: BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
            if (state is SignInLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is SignInInit) {
              return _buildBody(context);
            }

            if (state is SignInSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false);
              });

              return _buildBody(context);
            }

            if (state is ShowPasswordChanged) {
              return _buildBody(context);
            }

            if (state is SignInError) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Error : ${state.errorMessage}"),
                ));
              });

              return _buildBody(context);
            }

            return _buildBody(context);
          }),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
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
            BlocProvider.of<SignInBloc>(context)
                .add(TrySignIn(email: _email.text, password: _password.text));
          },
        ),
        const SizedBox(height: 5),
        _resetPasswordTest(),
      ],
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
          color: Theme.of(context).colorScheme.primaryContainer,
      ),
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

  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "What your password?",
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

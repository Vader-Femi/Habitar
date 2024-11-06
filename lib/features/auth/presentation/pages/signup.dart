import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../service_locator.dart';
import '../bloc/sign_up/sign_up_bloc.dart';
import '../bloc/sign_up/sign_up_event.dart';
import '../bloc/sign_up/sign_up_state.dart';
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

  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<SignUpBloc>()
        ..add(const InitSignUp()),
      child: Scaffold(
        appBar: AuthAppbar(pageNumber: 1, goBack: () {
          Navigator.pop(context);
        },),
        body: Padding(
          padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
          child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                }

                if (state is SignUpInit) {
                  return _buildBody(context);
                }

                if (state is SignUpSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.pushNamed(
                        context, '/AddFirstHabit');
                  });

                  return _buildBody(context);
                }

                if (state is ShowPasswordChanged) {
                  return _buildBody(context);
                }

                if (state is SignUpError) {

                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Error : ${state.errorMessage}"),
                    ));
                  });

                  return _buildBody(context);
                }


                return _buildBody(context);
              }
          ),
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
                  BlocProvider.of<SignUpBloc>(context).add(
                      TrySignUp(
                          name: _name.text,
                          email: _email.text,
                          password: _password.text
                      ));
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const SignInText(),
      ],
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

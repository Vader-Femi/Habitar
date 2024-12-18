import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../service_locator.dart';
import '../bloc/sign_up/sign_up_bloc.dart';
import '../bloc/sign_up/sign_up_event.dart';
import '../bloc/sign_up/sign_up_state.dart';
import '../widgets/app_bar.dart';
import '../../../../common/widgets/button/next_button.dart';

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
      create: (_) => sl<SignUpBloc>()..add(const InitSignUp()),
      child: Scaffold(
        appBar: AuthAppbar(
          title: "Create an account",
          goBack: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 30),
          child:
              BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
            if (state is SignUpLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }

            if (state is SignUpInit) {
              return _buildBody(context, state);
            }

            if (state is SignUpSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.pushNamed(context, '/AllSet');
              });

              return _buildBody(context, state);
            }

            if (state is ShowPasswordChanged) {
              return _buildBody(context, state);
            }

            if (state is SignUpError) {
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

  Widget _buildBody(BuildContext context, SignUpState state) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              _fullNameField(context),
              const SizedBox(height: 45),
              _emailField(context),
              const SizedBox(height: 45),
              _passwordField(context, state),
              const SizedBox(height: 45),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInButton(context),
            const SizedBox(width: 15),
            Expanded(
              child: NextButton(
                title: "Proceed",
                onClick: () async {
                  BlocProvider.of<SignUpBloc>(context).add(TrySignUp(
                      name: _name.text,
                      email: _email.text,
                      password: _password.text));
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Username",
      ),
      controller: _name,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Email",
      ),
      controller: _email,
    );
  }

  Widget _passwordField(BuildContext context, SignUpState state) {
    var showPassword = state.showPassword;

    return TextField(
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<SignUpBloc>(context).add(
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

  Widget _signInButton(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: Constants.skipButtonHeroTag,
        child: OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, '/SignIn'),
          style: OutlinedButton.styleFrom(
            elevation: 5,
          ),
          child: Text(
            "Sign in",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

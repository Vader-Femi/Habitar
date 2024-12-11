import 'package:flutter/material.dart';
import '../../../../core/assets/app_images.dart';
import '../../../../core/usecase/is_user_logged_in.dart';
import '../../../../service_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xff3C93C9),
        child: Center(
          child: Image.asset(
            AppImages.appLogoWhite,
            height: 300,
            width: 300,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }

  Future<void> redirect() async {
    var isLoggedIn = await sl<IsUserLoggedIn>().call();
    // await Future.delayed(const Duration(seconds: 1));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isLoggedIn == true) {
        Navigator.pushReplacementNamed(context, '/Home');
      } else {
        Navigator.pushReplacementNamed(context, '/GetStarted');
      }
    });
  }
}

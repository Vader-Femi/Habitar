import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/assets/app_vectors.dart';
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
      body: Center(
        child: SvgPicture.asset(AppVectors.appLogo, width: 128),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 1));
    var isLoggedIn = await sl<IsUserLoggedIn>().call();
    if ( isLoggedIn == true){
    Navigator.pushReplacementNamed(context, '/Home');
    } else {
      Navigator.pushReplacementNamed(context, '/GetStarted');
    }
  }
}

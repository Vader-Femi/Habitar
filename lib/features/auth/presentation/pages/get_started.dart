import 'package:flutter/material.dart';
import '../../../../core/assets/app_images.dart';
import '../../../../core/constants/constants.dart';
import '../widgets/next_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: Constants.headingHeroTag,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.getStarted),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Habitar",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "Build atomic habits",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                NextButton(
                  title: "Get Started",
                  onClick: () => Navigator.pushNamed(context, "/SignUp"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

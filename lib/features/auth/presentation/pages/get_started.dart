import 'package:flutter/material.dart';
import '../../../../common/widgets/button/basic_app_button.dart';
import '../../../../core/assets/app_images.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.getStarted),
                  fit: BoxFit.fitWidth),
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
                Hero(
                  tag: "Next Button",
                  child: BasicAppButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        "/SignUp",
                      );
                    },
                    title: "Get Started",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

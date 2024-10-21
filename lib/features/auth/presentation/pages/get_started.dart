import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapplication/core/assets/app_vectors.dart';
import 'package:myapplication/features/auth/presentation/pages/signin.dart';
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
                Text(
                  "Habitar",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Build atomic habits",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Theme.of(context).colorScheme.primary,),
                ),
                const SizedBox(height: 16),
                Hero(
                  tag: "Next Button",
                  child: BasicAppButton(
                    colour: Theme.of(context).colorScheme.secondary,
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

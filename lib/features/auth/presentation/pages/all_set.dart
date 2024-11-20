import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../../../../common/widgets/button/next_button.dart';

class AllSet extends StatefulWidget {
  const AllSet({super.key});

  @override
  State<AllSet> createState() => _AllSetState();
}

class _AllSetState extends State<AllSet> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(pageNumber: 4, goBack: () {
        Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false);
      },),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SingleChildScrollView(
              child: Column(
                children: [
                  _tick(context),
                  const SizedBox(height: 20),
                  _text(context),
                ],
              ),
            ),
            const Spacer(flex: 2),
            NextButton(
              title: "Start Tracking",
              onClick: () => Navigator.pushNamed(context, "/Home"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tick(BuildContext context) {
    return Icon(Icons.check_circle_outline_rounded, size: 150,color: Theme.of(context).colorScheme.primary,);
  }

  Widget _text(BuildContext context) {
    return const Text(
      "You're all set!",
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 20,
        // letterSpacing: 1.5,
      ),
    );
  }
}

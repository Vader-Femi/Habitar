import 'package:flutter/material.dart';
import 'package:myapplication/common/widgets/button/basic_app_button.dart';
import '../../../../config/theme/app_colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/sign_in_text.dart';
import '../widgets/skip_button.dart';

class AddAHabit extends StatefulWidget {
  const AddAHabit({super.key});

  @override
  State<AddAHabit> createState() => _AddAHabitState();
}

class _AddAHabitState extends State<AddAHabit> {
  final TextEditingController _habit = TextEditingController();

  List<bool> selectedDays = [true, false, false, true, false, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(pageNumber: 2),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _headingText(context),
                  const SizedBox(height: 30),
                  _habitField(context),
                  const SizedBox(height: 65),
                  _periodicitySelector(context),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Hero(
                    tag: "Skip Button",
                    child: skipButton(context),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Hero(
                    tag: "Next Button",
                    child: BasicAppButton(
                      onPressed: () {},
                      title: "Add habit",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _headingText(BuildContext context) {
    return const Text(
      "What habit do you want to start with?",
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 1,
      ),
    );
  }

  Widget _habitField(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: "Learn to code?",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColours.primaryUnfocused),
        ),
      ),
      controller: _habit,
    );
  }

  Widget _periodicitySelector(BuildContext context) {
    // List to store the selected days (false for unselected, true for selected)

    // List of days labels
    final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How often do you want to be reminded?",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            days.length,
            (index) {
              return GestureDetector(
                onTap: () {

                  setState(() {
                    // Toggle the selected state of the day
                    selectedDays[index] = !selectedDays[index];
                  });

                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    color: selectedDays[index] ? Theme.of(context).primaryColor : Colors.transparent,
                  ),
                  child: Text(
                    days[index],
                    style: TextStyle(
                      color: selectedDays[index] ? Colors.white : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../common/helpers/time_of_day.dart';
import '../../../../config/theme/app_colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/next_button.dart';
import '../widgets/sign_in_text.dart';
import '../widgets/skip_button.dart';

class HabitReminderTime extends StatefulWidget {
  const HabitReminderTime({super.key});

  @override
  State<HabitReminderTime> createState() => _HabitReminderTimeState();
}

class _HabitReminderTimeState extends State<HabitReminderTime> {

  List<ReminderTimeOfDay> timeOfDay = [
    ReminderTimeOfDay(timeIcon: Icons.wb_sunny_rounded, timeTitle: "Afternoon", isSelected: false),
    ReminderTimeOfDay(timeIcon: Icons.wb_twilight_rounded, timeTitle: "Morning", isSelected: false),
    ReminderTimeOfDay(timeIcon: Icons.dark_mode_rounded, timeTitle: "Evening", isSelected: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(pageNumber: 3, goBack: () {
        Navigator.pop(context);
      },),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _headingText(context),
                  const SizedBox(height: 30),
                  _timeSelector(context),
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
                    title: "Finish",
                    onClick: () => Navigator.pushNamed(context, "/AllSet"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const SignInText(),
          ],
        ),
      ),
    );
  }

  Widget _headingText(BuildContext context) {
    return const Text(
      "When do you want us to remind you?",
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 1,
      ),
    );
  }

  Widget _timeSelector(BuildContext context) {

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 24,
      children: List.generate(
        timeOfDay.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                final time = timeOfDay[index];
                timeOfDay[index] = time.copyWith(isSelected: !time.isSelected);
              });
            },
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                color: timeOfDay[index].isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    timeOfDay[index].timeIcon,
                    size: 36,
                    color: timeOfDay[index].isSelected
                        ? AppColours.primaryUnfocused
                        : Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    timeOfDay[index].timeTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: timeOfDay[index].isSelected
                          ? AppColours.primaryUnfocused
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../common/helpers/day_of_week.dart';
import '../../../../config/theme/app_colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/next_button.dart';
import '../widgets/sign_in_text.dart';
import '../widgets/skip_button.dart';

class AddAHabit extends StatefulWidget {
  const AddAHabit({super.key});

  @override
  State<AddAHabit> createState() => _AddAHabitState();
}

class _AddAHabitState extends State<AddAHabit> {
  final TextEditingController _habit = TextEditingController();

  List<ReminderDayOfWeek> dayOfWeek = [
    ReminderDayOfWeek(dayTitle: "M", isSelected: true),
    ReminderDayOfWeek(dayTitle: "T", isSelected: false),
    ReminderDayOfWeek(dayTitle: "W", isSelected: true),
    ReminderDayOfWeek(dayTitle: "T", isSelected: false),
    ReminderDayOfWeek(dayTitle: "F", isSelected: true),
    ReminderDayOfWeek(dayTitle: "S", isSelected: false),
    ReminderDayOfWeek(dayTitle: "S", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(pageNumber: 2, goBack: () {
        Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false);
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
                const Expanded(
                  child: SkipButton(),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: NextButton(
                    title: "Add habit",
                    onClick: () =>
                        Navigator.pushNamed(context, "/SetFirstHabitReminder"),
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
      ),
      controller: _habit,
    );
  }

  Widget _periodicitySelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What day(s) do you want to be reminded?",
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
            dayOfWeek.length,
                (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the selected state of the day
                    final day = dayOfWeek[index];
                    dayOfWeek[index] = day.copyWith(isSelected: !day.isSelected);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                    ),
                    color: dayOfWeek[index].isSelected ? Theme
                        .of(context)
                        .colorScheme.primaryContainer : Colors.transparent,
                  ),
                  child: Text(
                    dayOfWeek[index].dayTitle,
                    style: TextStyle(
                      color: dayOfWeek[index].isSelected ? Theme
                          .of(context)
                          .colorScheme.onPrimaryContainer : Theme
                          .of(context)
                          .colorScheme.onSurface,
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
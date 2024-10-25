import 'package:flutter/material.dart';
import 'package:myapplication/features/auth/presentation/widgets/next_button.dart';
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

  List<DayOfWeek> dayOfWeek = [
    DayOfWeek(dayTitle: "M", isSelected: true),
    DayOfWeek(dayTitle: "T", isSelected: false),
    DayOfWeek(dayTitle: "W", isSelected: true),
    DayOfWeek(dayTitle: "T", isSelected: false),
    DayOfWeek(dayTitle: "F", isSelected: true),
    DayOfWeek(dayTitle: "S", isSelected: false),
    DayOfWeek(dayTitle: "S", isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(pageNumber: 2),
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
                Expanded(
                  child: SkipButton(onClick: (){}),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: NextButton(
                    title: "Add habit",
                    onClick: () => Navigator.pushNamed(context, "/SetFirstHabitReminder"),
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
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColours.primaryUnfocused),
        ),
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
                    dayOfWeek[index].isSelected = !dayOfWeek[index].isSelected;
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
                    color: dayOfWeek[index].isSelected ? Theme.of(context).primaryColor : Colors.transparent,
                  ),
                  child: Text(
                    dayOfWeek[index].dayTitle,
                    style: TextStyle(
                      color: dayOfWeek[index].isSelected ? Colors.white : Theme.of(context).primaryColor,
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

class DayOfWeek{
  final String dayTitle;
  bool isSelected;

  DayOfWeek({required this.dayTitle, required this.isSelected});
}
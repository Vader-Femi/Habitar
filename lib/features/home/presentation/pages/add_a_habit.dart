import 'package:flutter/material.dart';
import '../../../../common/helpers/day_of_week.dart';
import '../../../../common/helpers/time_of_day.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../auth/presentation/widgets/next_button.dart';

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

  List<ReminderTimeOfDay> timeOfDay = [
    ReminderTimeOfDay(
        timeIcon: Icons.wb_sunny_rounded,
        timeTitle: "Afternoon",
        isSelected: false),
    ReminderTimeOfDay(
        timeIcon: Icons.wb_twilight_rounded,
        timeTitle: "Morning",
        isSelected: false),
    ReminderTimeOfDay(
        timeIcon: Icons.dark_mode_rounded,
        timeTitle: "Evening",
        isSelected: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _habitNameField(context),
        const SizedBox(height: 45),
        _periodicitySelector(context),
        const SizedBox(height: 45),
        _timeSelector(context),
        Spacer(),
        NextButton(
          title: "Add a new habit",
          onClick: (){},
        ),
      ],
    );
  }

  Widget _habitNameField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Setup your habit preference",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: const InputDecoration(
            hintText: "Touch grass",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColours.primaryUnfocused),
            ),
          ),
          controller: _habit,
        ),
      ],
    );
  }

  Widget _periodicitySelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Set periodicity",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 20),
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
                    color: dayOfWeek[index].isSelected
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                  ),
                  child: Text(
                    dayOfWeek[index].dayTitle,
                    style: TextStyle(
                      color: dayOfWeek[index].isSelected
                          ? Colors.white
                          : Theme.of(context).primaryColor,
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

  Widget _timeSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "When should we remind you?",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            timeOfDay.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    timeOfDay[index].isSelected = !timeOfDay[index].isSelected;
                  });
                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(10),
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
                      const SizedBox(height: 4),
                      Icon(
                        timeOfDay[index].timeIcon,
                        size: 36,
                        color: timeOfDay[index].isSelected
                            ? AppColours.primaryUnfocused
                            : Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 8),
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
                      const SizedBox(height: 4),
                    ],
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

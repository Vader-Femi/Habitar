import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../auth/presentation/widgets/next_button.dart';
import '../state/add_new_habit_view_model.dart';

class AddAHabit extends StatefulWidget {
  const AddAHabit({super.key});

  @override
  State<AddAHabit> createState() => _AddAHabitState();
}

class _AddAHabitState extends State<AddAHabit> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HabitNameField(),
        const SizedBox(height: 45),
        _PeriodicitySelector(),
        const SizedBox(height: 45),
        _TimeSelector(),
        Spacer(),
        NextButton(
          title: "Add a new habit",
          onClick: () {},
        ),
      ],
    );
  }

}

class _HabitNameField extends StatelessWidget {
  const _HabitNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Setup your habit preference",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
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
            controller: addNewHabitViewModel.getHabitController(),
          ),
        ],
      ),
    );
  }
}

class _TimeSelector extends StatelessWidget {
  const _TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SuperBuilder(
            builder: (BuildContext context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                addNewHabitViewModel.timeOfDay.length,
                    (index) {
                  return GestureDetector(
                    onTap: () => addNewHabitViewModel.toggleTImeOfDay(index),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        color: addNewHabitViewModel.timeOfDay[index].isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 4),
                          Icon(
                            addNewHabitViewModel.timeOfDay[index].timeIcon,
                            size: 36,
                            color: addNewHabitViewModel.timeOfDay[index].isSelected
                                ? AppColours.primaryUnfocused
                                : Theme.of(context).primaryColor,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            addNewHabitViewModel.timeOfDay[index].timeTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: addNewHabitViewModel.timeOfDay[index].isSelected
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
          ),
        ],
      ),
    );
  }

}

class _PeriodicitySelector extends StatelessWidget {
  const _PeriodicitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SuperBuilder(
            builder: (BuildContext context) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                addNewHabitViewModel.weekdays.length,
                (index) {
                  return GestureDetector(
                    onTap: () => addNewHabitViewModel.togglePeriodicity(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        color: addNewHabitViewModel.weekdays[index].isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                      ),
                      child: Text(
                        addNewHabitViewModel.weekdays[index].dayTitle,
                        style: TextStyle(
                          color: addNewHabitViewModel.weekdays[index].isSelected
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
          ),
        ],
      ),
    );
  }
}

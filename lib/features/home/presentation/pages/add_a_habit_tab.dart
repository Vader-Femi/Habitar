import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/res/data_state.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../state/add_a_habit_viewmodel.dart';

class AddAHabitTab extends StatelessWidget {
  const AddAHabitTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
      child: ListView(
        children: [
          _HabitNameField(),
          const SizedBox(height: 45),
          _PeriodicitySelector(),
          const SizedBox(height: 45),
          _TimeSelector(),
          const SizedBox(height: 55),
          NextButton(
            title: "Add a new habit",
            onClick: () async {
              var result = await addAHabitViewModel.addANewHabit();
              if (result is DataFailed) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error : ${(result).errorMessage}"),
                  ));
                }
              }
              if (result is DataSuccess) {
                getHomeViewModel.selectTabAtIndex(0);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Done"),
                  ));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HabitNameField extends StatelessWidget {
  const _HabitNameField();

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
              fontWeight: FontWeight.w500,
              fontSize: 26,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              hintText: "Touch grass",
            ),
            controller: addAHabitViewModel.getHabitController(),
          ),
        ],
      ),
    );
  }
}

class _TimeSelector extends StatelessWidget {
  const _TimeSelector();

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
                addAHabitViewModel.timeOfDay.length,
                (index) {
                  return GestureDetector(
                    onTap: () => addAHabitViewModel.toggleTImeOfDay(index),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        color: addAHabitViewModel.timeOfDay[index].isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 4),
                          Icon(
                            addAHabitViewModel.timeOfDay[index].timeIcon,
                            size: 36,
                            color:
                                addAHabitViewModel.timeOfDay[index].isSelected
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer
                                    : Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            addAHabitViewModel.timeOfDay[index].timeTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: addAHabitViewModel
                                      .timeOfDay[index].isSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer
                                  : Theme.of(context).colorScheme.onSurface,
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
  const _PeriodicitySelector();

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
                addAHabitViewModel.weekdays.length,
                (index) {
                  return GestureDetector(
                    onTap: () => addAHabitViewModel.togglePeriodicity(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        color: addAHabitViewModel.weekdays[index].isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
                      ),
                      child: Text(
                        addAHabitViewModel.weekdays[index].dayTitle,
                        style: TextStyle(
                          color: addAHabitViewModel.weekdays[index].isSelected
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onSurface,
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

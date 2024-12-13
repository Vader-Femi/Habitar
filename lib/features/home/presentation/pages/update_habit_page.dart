import 'package:flutter/material.dart';
import 'package:flutter_super/flutter_super.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/presentation/state/home_viewmodel.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/res/data_state.dart';
import '../../../../common/widgets/button/next_button.dart';
import '../state/update_habit_viewmodel.dart';
import '../widgets/update_habit_app_bar.dart';

class UpdateHabitPage extends StatefulWidget {
  const UpdateHabitPage({super.key, required this.oldHabit});

  final HabitEntity oldHabit;

  @override
  State<UpdateHabitPage> createState() => _UpdateHabitPageState();
}

class _UpdateHabitPageState extends State<UpdateHabitPage> {
  @override
  void initState() {
    updateHabitViewmodel.initHabit(widget.oldHabit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateHabitAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
        child: ListView(
          children: [
            _HabitNameField(),
            const SizedBox(height: 45),
            _PeriodicitySelector(),
            const SizedBox(height: 45),
            _TimeSelector(),
            const SizedBox(height: 55),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Hero(
                    tag: Constants.skipButtonHeroTag,
                    child: OutlinedButton(
                      onPressed: () async {
                        var result = await updateHabitViewmodel.deleteHabit();
                        if (result is DataFailed) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Error : ${(result).errorMessage}"),
                            ));
                          }
                        }
                        if (result is DataSuccess) {
                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Deleted"),
                            ));
                          }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        elevation: 5,
                      ),
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: NextButton(
                    title: "Update",
                    onClick: () async {
                      var result = await updateHabitViewmodel.updateHabit();
                      if (result is DataFailed) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Error : ${(result).errorMessage}"),
                          ));
                        }
                      }
                      if (result is DataSuccess) {
                        if (context.mounted) {
                          Navigator.pushNamedAndRemoveUntil(context, "/Home", (r) => false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Updated"),
                          ));
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
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
            "Enter your new preference",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 26,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(labelText: "Habit"),
            controller: updateHabitViewmodel.getHabitController(),
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
                updateHabitViewmodel.timeOfDay.length,
                (index) {
                  return GestureDetector(
                    onTap: () => updateHabitViewmodel.toggleTImeOfDay(index),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        color: updateHabitViewmodel.timeOfDay[index].isSelected
                            ? Theme.of(context).colorScheme.primaryContainer
                            : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 4),
                          Icon(
                            updateHabitViewmodel.timeOfDay[index].timeIcon,
                            size: 36,
                            color:
                                updateHabitViewmodel.timeOfDay[index].isSelected
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer
                                    : Theme.of(context).colorScheme.onSurface,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            updateHabitViewmodel.timeOfDay[index].timeTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: updateHabitViewmodel
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
            builder: (BuildContext context) => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  updateHabitViewmodel.weekdays.length,
                  (index) {
                    return GestureDetector(
                      onTap: () =>
                          updateHabitViewmodel.togglePeriodicity(index),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                Theme.of(context).colorScheme.surfaceContainer,
                          ),
                          color: updateHabitViewmodel.weekdays[index].isSelected
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Colors.transparent,
                        ),
                        child: Text(
                          updateHabitViewmodel.weekdays[index].weekNames.letter,
                          style: TextStyle(
                            color:
                                updateHabitViewmodel.weekdays[index].isSelected
                                    ? Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer
                                    : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import 'package:habitar/features/home/presentation/state/get_habits_viewmodel.dart';
import '../../../../config/theme/app_colors.dart';
import '../../domain/entities/habit_entity.dart';
import '../state/home_viewmodel.dart';

class SingleAddNewHabit extends StatelessWidget {
  const SingleAddNewHabit(
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Text("Add new habit",style: TextStyle(color: AppColours.primaryUnfocused),),),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 2, 14, 2),
          child: GestureDetector(
            onTap: () => getHomeViewModel.selectTabAtIndex(1),
            child: Container(
              decoration: BoxDecoration(
              color: AppColours.primaryUnfocused,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(Icons.add, size: 19,color: Colors.white,),
            ),
          ),
        ),
      ],
    );
  }
}

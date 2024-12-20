import 'package:flutter/material.dart';
import 'package:habitar/core/constants/constants.dart';
import '../state/home_viewmodel.dart';

class SingleAddNewHabit extends StatelessWidget {
  const SingleAddNewHabit({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text("Add new habit"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 2, 14, 2),
          child: Hero(
            tag: Constants.nextButtonHeroTag,
            child: GestureDetector(
              onTap: () => getHomeViewModel.selectTabAtIndex(1),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Icon(Icons.add, size: 19),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

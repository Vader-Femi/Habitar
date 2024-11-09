import 'package:flutter/material.dart';

class ReminderTimeOfDay{
  final IconData timeIcon;
  final String timeTitle;
  final bool isSelected;

  ReminderTimeOfDay copyWith({IconData? timeIcon, String? timeTitle, bool? isSelected}) {
    return ReminderTimeOfDay(
        timeIcon: timeIcon ?? this.timeIcon,
        timeTitle: timeTitle ?? this.timeTitle,
        isSelected: isSelected ?? this.isSelected);
  }

  ReminderTimeOfDay({required this.timeIcon, required this.timeTitle, required this.isSelected});
}
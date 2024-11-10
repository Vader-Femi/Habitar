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

  Map<String, dynamic> toJson() {
    return {
      'timeIcon': timeIcon,
      'timeTitle': timeTitle,
      'isSelected': isSelected,
    };
  }

  factory ReminderTimeOfDay.fromJson(Map<String, dynamic> json) {
    return ReminderTimeOfDay(
      timeIcon: json["timeIcon"],
      timeTitle: json["timeTitle"],
      isSelected: json["isSelected"],
    );
  }

  ReminderTimeOfDay({required this.timeIcon, required this.timeTitle, required this.isSelected});
}
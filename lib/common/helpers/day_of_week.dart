import 'package:habitar/common/helpers/week_names.dart';

class ReminderDayOfWeek {
  final WeekNames weekNames;
  final bool isSelected;

  ReminderDayOfWeek copyWith({WeekNames? weekNames, bool? isSelected}) {
    return ReminderDayOfWeek(
        weekNames: weekNames ?? this.weekNames,
        isSelected: isSelected ?? this.isSelected);
  }

  Map<String, dynamic> toJson() {
    return {
      'weekNames': weekNames,
      'isSelected': isSelected,
    };
  }

  factory ReminderDayOfWeek.fromJson(Map<String, dynamic> json) {
    return ReminderDayOfWeek(
      weekNames: json["weekNames"],
      isSelected: json["isSelected"],
    );
  }

  ReminderDayOfWeek({required this.weekNames, required this.isSelected});
}

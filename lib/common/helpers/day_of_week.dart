class ReminderDayOfWeek {
  final String dayTitle;
  final bool isSelected;

  ReminderDayOfWeek copyWith({String? dayTitle, bool? isSelected}) {
    return ReminderDayOfWeek(
        dayTitle: dayTitle ?? this.dayTitle,
        isSelected: isSelected ?? this.isSelected);
  }

  ReminderDayOfWeek({required this.dayTitle, required this.isSelected});
}

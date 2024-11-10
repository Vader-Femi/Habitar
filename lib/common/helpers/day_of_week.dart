class ReminderDayOfWeek {
  final String dayTitle;
  final bool isSelected;

  ReminderDayOfWeek copyWith({String? dayTitle, bool? isSelected}) {
    return ReminderDayOfWeek(
        dayTitle: dayTitle ?? this.dayTitle,
        isSelected: isSelected ?? this.isSelected);
  }

  Map<String, dynamic> toJson() {
    return {
      'dayTitle': dayTitle,
      'isSelected': isSelected,
    };
  }

  factory ReminderDayOfWeek.fromJson(Map<String, dynamic> json) {
    return ReminderDayOfWeek(
      dayTitle: json["dayTitle"],
      isSelected: json["isSelected"],
    );
  }

  ReminderDayOfWeek({required this.dayTitle, required this.isSelected});
}

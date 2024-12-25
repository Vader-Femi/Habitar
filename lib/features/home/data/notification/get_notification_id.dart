int getNotificationId(
  String habit,
  String day,
  String time,
) {
  return "$habit$day$time".hashCode;
}

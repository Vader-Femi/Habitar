String getTodayDate (){
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);
  return date.toString();
}
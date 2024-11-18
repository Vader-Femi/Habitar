class WeekNames{
  final String shortName;
  final String longName;
  final int positionInWeek;

  WeekNames({required this.shortName, required this.longName, required this.positionInWeek});
}

final weekNames = [
  WeekNames(shortName: "Mon", longName: "Mondays", positionInWeek: 1),
  WeekNames(shortName: "Tue", longName: "Tuesdays", positionInWeek: 2),
  WeekNames(shortName: "Wed", longName: "Wednesdays", positionInWeek: 3),
  WeekNames(shortName: "Thur", longName: "Thursdays", positionInWeek: 4),
  WeekNames(shortName: "Fri", longName: "Fridays", positionInWeek: 5),
  WeekNames(shortName: "Sat", longName: "Saturdays", positionInWeek: 6),
  WeekNames(shortName: "Sun", longName: "Sundays", positionInWeek: 7),
];
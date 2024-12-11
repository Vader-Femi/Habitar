class WeekNames{
  final String letter;
  final String shortName;
  final String longName; // This is what I actually use
  final int positionInWeek;

  WeekNames({required this.shortName, required this.longName, required this.positionInWeek, required this.letter});
}

final weekNames = [
  WeekNames(letter: "M", shortName: "Mon", longName: "Mondays", positionInWeek: 1),
  WeekNames(letter: "T", shortName: "Tue", longName: "Tuesdays", positionInWeek: 2),
  WeekNames(letter: "W", shortName: "Wed", longName: "Wednesdays", positionInWeek: 3),
  WeekNames(letter: "T", shortName: "Thur", longName: "Thursdays", positionInWeek: 4),
  WeekNames(letter: "F", shortName: "Fri", longName: "Fridays", positionInWeek: 5),
  WeekNames(letter: "S", shortName: "Sat", longName: "Saturdays", positionInWeek: 6),
  WeekNames(letter: "S", shortName: "Sun", longName: "Sundays", positionInWeek: 7),
];
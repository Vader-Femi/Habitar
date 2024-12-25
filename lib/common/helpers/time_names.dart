class TimeNames{
  final String name;
  final int time;
  final int positionInDay;

  TimeNames({required this.name, required this.time, required this.positionInDay});
}

final timeNames = [
  TimeNames(name: "Morning", time: 8, positionInDay: 1),
  TimeNames(name: "Afternoon", time: 12, positionInDay: 2),
  TimeNames(name: "Evening", time: 19, positionInDay: 3),
];
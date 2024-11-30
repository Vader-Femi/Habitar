import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:timezone/timezone.dart';

import '../../common/helpers/time_names.dart';
import '../../common/helpers/week_names.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {}

  // Init notification plugin
  static Future<void> init() async {
    // Define android init settings
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    // Define ios init settings
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    // Combine android and ios init settings
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: iOSInitializationSettings);

    // Init the plugin with the specified settings
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    // Request notification permission from android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  //Cancel and delete all notifications
  Future<void> cancelAndDeleteAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  //Show an instant notification
  Future<void> showInstantNotification(String title, String body) async {
    //Define Notification Details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
          "habit_reminders_id",
          "Habit reminders",
          importance: Importance.max,
          priority: Priority.defaultPriority,
        ),
        iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.show(
        DateTime.now().microsecond, title, body, platformChannelSpecifics);
  }

  //Schedule notification
  Future<void> scheduleNotifications(
      {String title = "Your habit reminder",
      required String body,
      required DateTime scheduleDateTime}) async {
    //Define Notification Details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
            "habit_reminders_id", "Habit reminders",
            importance: Importance.max, priority: Priority.defaultPriority),
        iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      DateTime.now().microsecond + DateTime.now().millisecond,
      title,
      "Remember to: $body",
      TZDateTime.from(scheduleDateTime, local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  //Schedule notification for habits
  Future<void> scheduleNotificationsForHabits(List<HabitEntity> habits) async {
    await cancelAndDeleteAllNotifications();

    for (var habit in habits){
      for (var day in habit.selectedPeriodicity) {
        final desiredWeekDay =
        (weekNames.firstWhere((element) => element.longName == day));

        for (var time in habit.selectedTimeOfDay) {
          final desiredDayTime =
          (timeNames.firstWhere((element) => element.name == time));

          var today = DateTime.now();
          var todayWeekday = today.weekday;

          var scheduleDateTime = today.copyWith(
            hour: desiredDayTime.time,
            day: today.day + (desiredWeekDay.positionInWeek - todayWeekday),
          );

          await scheduleNotifications(
            body: habit.habit,
            scheduleDateTime: scheduleDateTime,
          );
        }
      }
    }

  }

}

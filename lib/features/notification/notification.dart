import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

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
  Future<void> scheduleSingleNotification({
      required String title, required String body, required DateTime scheduleDate}) async {
    //Define Notification Details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
            "habit_reminders_id", "Habit reminders",
            importance: Importance.max, priority: Priority.defaultPriority),
        iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      DateTime.now().microsecond,
      title,
      body,
      TZDateTime.from(scheduleDate, local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }

  Future<void> scheduleIntervalNotification({
      required String title, required String body, RepeatInterval interval = RepeatInterval.weekly}) async {
    //Define Notification Details
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: AndroidNotificationDetails(
            "habit_reminders_id", "Habit reminders",
            channelDescription: "These will enable you see reminders on your habits",
            importance: Importance.max, priority: Priority.defaultPriority),
        iOS: DarwinNotificationDetails());
    await flutterLocalNotificationsPlugin.periodicallyShow(
      DateTime.now().microsecond,
      title,
      body,
      interval,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
    );
  }
}

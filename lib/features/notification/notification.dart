import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habitar/core/navigation/navigation_service.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import 'package:timezone/timezone.dart';
import '../../common/helpers/time_names.dart';
import '../../common/helpers/week_names.dart';
import '../../service_locator.dart';
import '../home/domain/usecases/tick_habits.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @pragma('vm:entry-point')
  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    // Todo contribute by editing notificationResponse.notificationResponseType
    // Todo create a screen that shows Done with options to go to app or CLose app

    if (notificationResponse.actionId == "mark_as_done_id") {

      var habit = HabitEntity.fromJson(jsonDecode(notificationResponse.payload.toString()));

      await sl<TickHabitsUseCase>().call(params: TodayHabitEntity.fromEntity(habit));
    }

    if (notificationResponse.actionId == "open_id") {
      if (NavigationService.navigatorKey.currentContext != null) {
        await Navigator.pushNamed(
            NavigationService.navigatorKey.currentContext!, "/Home");
      }
    }
  }

  //Define Notification Details
  final NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: AndroidNotificationDetails(
      "habit_reminders_id",
      "Habit reminders",
      channelDescription: "Notifications to remind you about your habits",
      importance: Importance.max,
      priority: Priority.defaultPriority,
      ticker: "Ticker",
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction('open_id', 'Open'),
        AndroidNotificationAction('mark_as_done_id', 'Mark as done'),
      ],
    ),
    iOS: DarwinNotificationDetails(
      threadIdentifier: 'habit_reminders_id',
    ),
  );

  // Init notification plugin
  static Future<void> init() async {
    // Define android init settings
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    // Define ios init settings
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    // Define linux init settings
    final LinuxInitializationSettings linuxInitializationSettings =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    // Combine android and ios init settings
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
      linux: linuxInitializationSettings,
    );

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

    // Request notification permission from ios
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  //Cancel and delete all notifications
  Future<void> cancelAndDeleteAllNotifications() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    if (pendingNotificationRequests.isNotEmpty) {
      await flutterLocalNotificationsPlugin.cancelAll();
    }
  }

  //Show an instant notification
  Future<void> showInstantNotification({String title = "Your habit reminder", required HabitEntity habit}) async {
    await flutterLocalNotificationsPlugin.show(
        payload: habit.toJson().toString(),
        DateTime.now().microsecond,
        title,
        "Remember: ${habit.habit}",
        platformChannelSpecifics);
  }

  //Schedule notification
  Future<void> scheduleNotifications({
    String title = "Your habit reminder",
    required HabitEntity habit,
    required DateTime scheduleDateTime,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      DateTime.now().microsecond,
      title,
      "Remember: ${habit.habit}",
      payload: habit.toJson().toString(),
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

    for (var habit in habits) {
      for (var day in habit.selectedPeriodicity) {
        for (var time in habit.selectedTimeOfDay) {
          var desiredWeekDay =
              (weekNames.firstWhere((element) => element.longName == day));

          var desiredDayTime =
              (timeNames.firstWhere((element) => element.name == time));

          var today = DateTime.now();
          var todayWeekday = today.weekday;

          var scheduleDateTime = today.copyWith(
            hour: desiredDayTime.time,
            day: today.day + (desiredWeekDay.positionInWeek - todayWeekday),
          );

          await scheduleNotifications(
            habit: habit,
            scheduleDateTime: scheduleDateTime,
          );
        }
      }
    }
  }
}

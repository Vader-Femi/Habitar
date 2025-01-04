import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habitar/common/helpers/get_today_date.dart';
import 'package:habitar/core/navigation/navigation_service.dart';
import 'package:habitar/features/home/domain/entities/habit_entity.dart';
import 'package:habitar/features/home/domain/entities/today_habit_entity.dart';
import 'package:timezone/timezone.dart';
import '../../../../common/helpers/time_names.dart';
import '../../../../common/helpers/week_names.dart';
import '../../../../firebase_options.dart';
import '../../../../service_locator.dart';
import '../../domain/usecases/get_single_habit_from_db.dart';
import '../../domain/usecases/tick_habits.dart';
import 'get_notification_id.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @pragma('vm:entry-point')
  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    // Todo check out notificationResponse.notificationResponseType

    if (notificationResponse.actionId == "mark_as_done_id") {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      try {
        await initializeDependencies();
      } catch (e) {
        if (kDebugMode) {
          print(
              "Failed to init dependencies. Dependencies might already be initialized ${e.toString()}");
        }
      }

      var habitEntity = HabitEntity.fromJson(
          jsonDecode(notificationResponse.payload.toString()));
      var todayHabitEntity =
          TodayHabitEntity.fromEntity(habitEntity).copyWith(isSelected: true);

      var habitFromDB = await sl<GetSingleHabitFromDBUseCase>()
          .call(params: todayHabitEntity.habit.habit);
      if (habitFromDB?.lastDateTicked != getTodayDate()) {
        await sl<TickHabitsUseCase>().call(params: todayHabitEntity);
      }
    }

    if (notificationResponse.actionId == "open_id") {
      if (NavigationService.navigatorKey.currentContext != null) {
        await NavigationService.navigatorKey.currentState?.pushNamed("/Home");
        // await Navigator.pushNamed(
        //     NavigationService.navigatorKey.currentContext!, "/Home");
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
        // AndroidNotificationAction('open_id', 'Open'), Todo setup later
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
  Future<void> showInstantNotification(
      {String title = "Your habit reminder",
      required HabitEntity habit}) async {
    await flutterLocalNotificationsPlugin.show(
      habit.habit.hashCode,
      title,
      "Remember: ${habit.habit}",
      platformChannelSpecifics,
      payload: json.encode(habit.toJson()),
    );
  }

  //Schedule notification
  Future<void> scheduleNotification({
    String title = "Your habit reminder",
    required int id,
    required HabitEntity habit,
    required DateTime scheduleDateTime,
  }) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      "Remember: ${habit.habit}",
      TZDateTime.from(scheduleDateTime, local),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: json.encode(habit.toJson()),
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  Future<void> cancelScheduledNotifications(HabitEntity habit) async {
    for (var day in habit.selectedPeriodicity) {
      for (var time in habit.selectedTimeOfDay) {
        await flutterLocalNotificationsPlugin
            .cancel(getNotificationId(habit.habit, day, time));
      }
    }
  }

  //Schedule notification for habit
  Future<void> scheduleNotificationsForHabit(HabitEntity habit) async {
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

        await scheduleNotification(
          id: getNotificationId(habit.habit, day, time),
          habit: habit,
          scheduleDateTime: scheduleDateTime,
        );
      }
    }
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
            minute: 01,
          );

          await scheduleNotification(
            id: getNotificationId(habit.habit, day, time),
            habit: habit,
            scheduleDateTime: scheduleDateTime,
          );
        }
      }
    }
  }

  //Reschedule notification for ticked habits
  Future<void> cancelNotificationsForToday(HabitEntity habit) async {
    await cancelScheduledNotifications(habit);

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
          minute: 01,
        );

        if (todayWeekday == desiredWeekDay.positionInWeek) {
          scheduleDateTime.add(Duration(days: 7));
        }

        await scheduleNotification(
          id: getNotificationId(habit.habit, day, time),
          habit: habit,
          scheduleDateTime: scheduleDateTime,
        );
      }
    }
  }
}

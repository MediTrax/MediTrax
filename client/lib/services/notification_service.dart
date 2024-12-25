import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import '../models/medication_reminder.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._();
  factory NotificationService() => _instance;
  NotificationService._();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  // Add new field for callback
  Function(String?)? _onNotificationResponse;

  bool get isSupported {
    if (kIsWeb) {
      debugPrint('Running on web platform - notifications not supported');
      return false;
    }
    if (Platform.isAndroid) {
      debugPrint('Running on Android - notifications supported');
      return true;
    }
    if (Platform.isIOS) {
      debugPrint('Running on iOS - notifications supported');
      return true;
    }
    debugPrint('Running on unsupported platform: ${Platform.operatingSystem}');
    return false;
  }

  // Add method to set notification response callback
  Future<void> setOnNotificationResponse(Function(String?) callback) async {
    _onNotificationResponse = callback;
  }

  Future<void> initialize() async {
    if (!isSupported) {
      debugPrint(
          'Skipping notification initialization on unsupported platform');
      return;
    }

    try {
      debugPrint('Initializing notifications...');

      // Initialize timezone
      tz.initializeTimeZones();
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      debugPrint('Timezone: $timeZoneName');
      tz.setLocalLocation(tz.getLocation(timeZoneName));

      // Initialize notification settings
      const androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const iosSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      const initSettings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _notifications.initialize(
        initSettings,
        onDidReceiveNotificationResponse: (details) async {
          debugPrint('Notification tapped: ${details.payload}');
          _onNotificationResponse?.call(details.payload);
        },
      );

      await _requestPermissions();
      debugPrint('Notifications initialized successfully');
    } catch (e, stack) {
      debugPrint('Error initializing notifications: $e');
      debugPrint('Stack trace: $stack');
    }
  }

  Future<void> _requestPermissions() async {
    // Request Android permissions
    if (Platform.isAndroid) {
      await _notifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
    }

    // Request iOS permissions
    if (Platform.isIOS) {
      await _notifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }
  }

  Future<void> scheduleReminder(
      MedicationReminder reminder, String medicationName) async {
    if (!isSupported) {
      debugPrint('Skipping reminder scheduling on unsupported platform');
      return;
    }

    try {
      debugPrint('Scheduling reminder for $medicationName...');
      const androidDetails = AndroidNotificationDetails(
        'medication_reminders',
        '服药提醒',
        channelDescription: '用于发送服药提醒的通知',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        enableLights: true,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('alarm'),
        fullScreenIntent: true,
        category: AndroidNotificationCategory.alarm,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'alarm.aiff',
        interruptionLevel: InterruptionLevel.timeSensitive,
      );

      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      // Convert reminder time to local timezone
      final DateTime reminderTime = reminder.reminderTime.toLocal();

      // Calculate next occurrence
      final now = DateTime.now();
      tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
        reminderTime.year,
        reminderTime.month,
        reminderTime.day,
        reminderTime.hour,
        reminderTime.minute,
      );

      // If the time has passed, schedule for the next day
      if (scheduledDate.isBefore(now)) {
        scheduledDate = scheduledDate.add(const Duration(days: 1));
      }

      // Cancel any existing notification for this reminder
      await cancelReminder(reminder.id);

      // Schedule the new notification
      await _notifications.zonedSchedule(
        reminder.id.hashCode,
        '服药提醒',
        '该服用 $medicationName 了',
        scheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: reminder.id,
      );

      debugPrint(
          'Successfully scheduled reminder for $medicationName at ${scheduledDate.toString()}');
    } catch (e, stack) {
      debugPrint('Error scheduling reminder: $e');
      debugPrint('Stack trace: $stack');
    }
  }

  Future<void> cancelReminder(String reminderId) async {
    await _notifications.cancel(reminderId.hashCode);
  }

  Future<void> cancelAllReminders() async {
    await _notifications.cancelAll();
  }

  Future<void> zonedSchedule(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
    String payload,
  ) async {
    if (!isSupported) {
      debugPrint('Skipping notification scheduling on unsupported platform');
      return;
    }

    try {
      const androidDetails = AndroidNotificationDetails(
        'treatment_schedules',
        '治疗日程提醒',
        channelDescription: '用于发送治疗日程提醒的通知',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        enableLights: true,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('alarm'),
        fullScreenIntent: true,
        category: AndroidNotificationCategory.reminder,
      );

      const iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        sound: 'alarm.aiff',
        interruptionLevel: InterruptionLevel.timeSensitive,
      );

      const details = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      final tz.TZDateTime scheduledDate = tz.TZDateTime(
        tz.local,
        scheduledTime.year,
        scheduledTime.month,
        scheduledTime.day,
        scheduledTime.hour,
        scheduledTime.minute,
      );

      // Cancel any existing notification with this ID
      await _notifications.cancel(id);

      // Schedule the new notification
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        scheduledDate,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );

      debugPrint(
          'Successfully scheduled treatment notification for ${scheduledDate.toString()}');
    } catch (e, stack) {
      debugPrint('Error scheduling treatment notification: $e');
      debugPrint('Stack trace: $stack');
    }
  }
}

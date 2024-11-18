import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:test_notification/helpers/cache_helper.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  static final localNotification = FlutterLocalNotificationsPlugin();
  static Future<void> init() async {
    CacheHelper.saveData(key: Keys.notificationId, value: 0);
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await localNotification.initialize(initializationSettings);

    await localNotification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> showNotification() async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await localNotification.show(
      0,
      'Flutter Notification',
      'Flutter Local Notification',
      notificationDetails,
    );
  }

  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );

    final dateTime = tz.TZDateTime.from(scheduledDate, tz.local)
        .add(const Duration(minutes: 1));
    await localNotification.zonedSchedule(
      CacheHelper.getData(key: Keys.notificationId)!,
      title,
      body,
      dateTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );

    CacheHelper.saveData(
        key: Keys.notificationId,
        value: CacheHelper.getData(key: Keys.notificationId)! + 1);
  }
}

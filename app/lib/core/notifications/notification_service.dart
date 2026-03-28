import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/services.dart';
import 'package:timezone/data/latest.dart' as tz;

final notificationServiceProvider = Provider<AppNotificationService>((ref) {
  return LocalNotificationService();
});

abstract class AppNotificationService {
  Future<void> initialize();
  Future<void> scheduleMedicationReminder({
    required String title,
    required String body,
  });
}

class LocalNotificationService implements AppNotificationService {
  LocalNotificationService() : _plugin = FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;

  @override
  Future<void> initialize() async {
    try {
      tz.initializeTimeZones();
      const androidSettings = AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      );
      const settings = InitializationSettings(android: androidSettings);
      await _plugin.initialize(settings: settings);
    } on MissingPluginException {
      return;
    }
  }

  @override
  Future<void> scheduleMedicationReminder({
    required String title,
    required String body,
  }) async {
    // Scheduling is intentionally deferred until reminder UX is finalized.
    return;
  }
}

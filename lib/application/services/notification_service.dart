import 'dart:io';

import 'package:flutter_course_2022/application/models/weather_alert_model.dart';
import 'package:flutter_course_2022/data/repositories/alert_repository.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {
  static const String _notificationChannelId = 'flutter_weather';
  static const String _notificationChannelName = 'Flutter Weather';

  final AlertRepository _alertRepository;
  final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService(this._alertRepository) {
    Stream<bool?>.fromFuture(_configureNotifications())
        .where((bool? event) => event == true)
        .take(1)
        .switchMap((_) => _alertRepository.notNotifiedAlert())
        .where((WeatherAlertModel? event) => event != null)
        .map((WeatherAlertModel? e) => e!)
        .asyncMap((WeatherAlertModel event) => _showNotification(event))
        .publish()
        .connect();
  }

  Future<bool?> _configureNotifications() => _notificationPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        ),
      );

  Future<void> _showNotification(WeatherAlertModel model) async {

    if (Platform.isIOS) {
      await _notificationPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    }

    await _notificationPlugin.show(
      model.id!,
      model.name,
      model.description,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _notificationChannelId,
          _notificationChannelName,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: model.id.toString(),
    );

    await _alertRepository.putAlert(model.copyWith(isNotified: true));
  }
}

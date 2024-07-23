import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handelBackMessage(RemoteMessage message) async {
  print(
      'Notification received: ${message.notification?.title}, ${message.notification?.body}');
}

class FirebaseApi {
  final _fireebaseMessaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
      'high_imprortance_channel', 'High Imprortance Channel',
      description: 'This channel is used for important notifications',
      importance: Importance.defaultImportance);
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    await _fireebaseMessaging.requestPermission();
    final fCMToken = await _fireebaseMessaging.getToken();
    print("token: $fCMToken");
    FirebaseMessaging.onBackgroundMessage(handelBackMessage);
  }
}

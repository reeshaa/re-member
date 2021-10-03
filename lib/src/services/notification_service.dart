import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//
class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationService() {
    getToken().then((token) {
      print("fcm token");
      print(token);
      init();
    });
  }
  init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notif');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    var flutterlocalnotifications = FlutterLocalNotificationsPlugin();

    await flutterlocalnotifications.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      print(notification.body);
      print(message);
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterlocalnotifications.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                "a1",
                "re-member app",
                "hi",
                // icon: android?.smallIcon,
                // other properties...
              ),
            ));
      }
    });
  }

  Future<String?> getToken() {
    return messaging.getToken();
  }
}

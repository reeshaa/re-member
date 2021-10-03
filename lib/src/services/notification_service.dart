import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//
class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationService(uid) {
    getToken().then((token) {
      print("fcm token");
      sendFcmToken(token, uid);
      print(token);
      init();
    });
  }
  sendFcmToken(token, String uid) async {
    var headers = {'uid': uid, 'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('http://aakashp.freemyip.com/re-member-server/register/fcm'));
    request.body = json.encode({"fcmToken": token});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
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
      // print(notification?.body);
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

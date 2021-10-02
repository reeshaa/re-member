// ignore: non_constant_identifier_names
import 'package:get_it/get_it.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/userService.dart';
import 'package:re_member/src/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';

// ignore:non_constant_identifier_names
final ServiceLocator = GetIt.instance;

/// Register various services used within the app to ensure neat transactions
///  between UI and API layers
void setup() async {
  await Firebase.initializeApp();
  ServiceLocator.registerSingleton<Api>(Api());
  ServiceLocator.registerSingleton<UserService>(UserService());
  NotificationService();
}

// ignore: non_constant_identifier_names
import 'package:get_it/get_it.dart';
import 'package:re_member/src/services/api.dart';

// ignore:non_constant_identifier_names
final ServiceLocator = GetIt.instance;

/// Register various services used within the app to ensure neat transactions
///  between UI and API layers
void setup() {
  ServiceLocator.registerSingleton<Api>(Api());
}

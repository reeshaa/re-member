import 'package:flutter/material.dart';
import 'package:re_member/src/services/service_locator.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();

  runApp(MyApp());
}

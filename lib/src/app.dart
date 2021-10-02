import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_member/src/root.dart';
import 'package:re_member/src/services/auth_service.dart';

import 'settings/settings_controller.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthService.instance(),
        ),
      ],
      child: AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            restorationScopeId: 'app',
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            home: Root().getHome(),
          );
        },
      ),
    );
  }
}

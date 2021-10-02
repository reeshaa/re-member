import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_member/src/services/auth_service.dart';
// import 'package:re_member/src/settings/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () =>
                    Provider.of<AuthService>(context, listen: false).signout(),
                child: Text("Logout"),
              ),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_member/src/pages/home_page.dart';
import 'package:re_member/src/pages/login_page.dart';
import 'package:re_member/src/pages/splash_screen.dart';
import 'package:re_member/src/services/auth_service.dart';
import 'package:re_member/src/utils/enum.dart';

/// Utility class which conditionally renders the app's root view
/// based on the Authentication state
///
/// Requires the AuthService Provider to be initialized
class Root {
  getHome() {
    return Builder(
      builder: (context) {
        /// Watch for changes to [authState] from the respective ChangeNotifier
        switch (context.watch<AuthService>().authState) {
          case AuthState.loggedIn:
            return Home();
          case AuthState.none:
            return SplashScreen();
          default:
            return LoginPage();
          // return App(); //Uncomment to bypass login for testing purposes
        }
        // return LoginPage();

        // return SplashScreen();
      },
    );
  }
}

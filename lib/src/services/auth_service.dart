import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  late AuthState _authState = AuthState.none;
  String? email;
  String? _accessToken;
  late SharedPreferences _prefs;

  AuthState get authState => _authState;
  AuthService.instance() {}
  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  attemptLogin(BuildContext context, String email, String password) async {
    print("Entered login function");
    email = email.trim();
    password = password.trim();
    Map<String, dynamic> body = <String, dynamic>{
      "email": email,
      "password": password
    };
    // debugPrint(body.toString());
    Response<dynamic>? response;
    _authState = AuthState.loggedIn;
    notifyListeners();

    return;
    try {
      // This request will carry empty Authorization token, which should be ignored by the server
      response = await ServiceLocator<Api>().POST(Api.loginEndpoint, body);
      if (response == null) {
        print("Null Response");
        // Trigger error message
        // return connectionFailedFallback(context);
      }
    } catch (e) {
      // return invalidServerResponseFallback(context);
    }

    notifyListeners();
  }

  /// Checks if [_accessToken] is a valid JWT or not
  bool _isSessionValid() {
    if (_accessToken == null) return false;
    return !Jwt.isExpired(_accessToken ?? "");
  }

  /// Mark session as expired and notify listeners
  void expireSession() {
    _authState = AuthState.sessionExpired;
    notifyListeners();
  }
}

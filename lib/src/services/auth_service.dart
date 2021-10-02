import 'package:cool_alert/cool_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:re_member/src/services/api.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/services/userService.dart';
import 'package:re_member/src/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  late AuthState _authState = AuthState.none;
  String? _email;
  String? _uid;
  String? _accessToken;
  late SharedPreferences _prefs;

  AuthState get authState => _authState;
  AuthService.instance() {
    _loadAuthData().then(
      (_) {
        print(_uid);
        if (_uid != null || _uid == "")
          _authState = AuthState.loggedIn;
        else
          _authState = AuthState.loggedOut;
        notifyListeners();
      },
    );
  }

  Future<void> _loadAuthData() async {
    await _initPrefs();
    _accessToken = _prefs.getString('authToken');
    _email = _prefs.getString('authEmail');
    _uid = _prefs.getString('authUid');
    debugPrint("Auth Data:");
    debugPrint(_email);
    debugPrint(_uid);
    return;
  }

  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  attemptLogin(BuildContext context, String email, String password) async {
    // _authState = AuthState.loggedIn;
    // notifyListeners();
    // return;

    print("Entered login function");
    email = email.trim();
    password = password.trim();
    Map<String, dynamic> body = <String, dynamic>{
      "email": email,
      "pass": password
    };
    // debugPrint(body.toString());
    Response<dynamic>? response;

    try {
      // This request will carry empty Authorization token, which should be ignored by the server
      response = await ServiceLocator<Api>().POST(Api.loginEndpoint, body);
      if (response == null) {
        print("Null Response");
        // Trigger error message
        // return connectionFailedFallback(context);
      } else {
        if (response.statusCode == 200) {
          var data = response.data;
          _uid = data['uid'];
          _email = email;

          _saveCredentials();
          _initUserProfile(data);

          _authState = AuthState.loggedIn;
          notifyListeners();
          return true;
        } else if (response.statusCode == 401) {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.warning,
            text: "You have entered an incorrect email/password",
          );
          return false;
        } else {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "Login failed. Please try again later",
          );
          return false;
        }
      }
    } catch (e) {
      // return invalidServerResponseFallback(context);
    }

    notifyListeners();
  }

  Future<bool> register(
      BuildContext context, String email, String password, String name) async {
    print("Entered register function");
    email = email.trim();
    password = password.trim();
    name = name.trim();
    Map<String, dynamic> body = <String, dynamic>{
      "email": email,
      "pass": password,
      "displayName": name,
    };
    // debugPrint(body.toString());
    Response<dynamic>? response;
    // _authState = AuthState.loggedIn;
    // notifyListeners();

    // return;
    try {
      // This request will carry empty Authorization token, which should be ignored by the server
      response = await ServiceLocator<Api>().POST(Api.registerEndpoint, body);
      if (response == null) {
        print("Null Response");
        // Trigger error message
        // return connectionFailedFallback(context);
      } else {
        if (response.statusCode == 200) {
          _authState = AuthState.loggedIn;
          notifyListeners();

          var data = response.data;
          _uid = data['uid'];
          _email = email;

          _saveCredentials();
          _initUserProfile(data);
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Registration successful",
          );
          return true;
        } else {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "Could not register, try again later",
          );
          return false;
        }
      }
    } catch (e) {
      return false;
    }

    return false;
    // notifyListeners();
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

  Future<void> _saveCredentials() async {
    await _prefs.setString('authEmail', _email ?? "");
    await _prefs.setString('authUid', _uid ?? "");
  }

  Future<void> _initUserProfile(dynamic data) async {
    ServiceLocator<UserService>().name = data["displayName"];
    ServiceLocator<UserService>().uid = data["uid"];
    ServiceLocator<UserService>().email = data["email"];
  }

  signout() async {
    await _prefs.remove('authEmail');
    await _prefs.remove('authUid');

    _authState = AuthState.loggedOut;
    _accessToken = '';
    _uid = '';
    _email = '';

    notifyListeners();
  }

  _signoutAfterPwdChange() async {
    // await _prefs.remove('authEmail');
    await _prefs.remove('authUid');

    _authState = AuthState.loggedOut;
    _accessToken = '';
    _uid = '';
    notifyListeners();
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:re_member/src/services/service_locator.dart';
import 'package:re_member/src/services/userService.dart';

class Api {
  static String baseUrl = 'http://aakashp.freemyip.com/re-member-server/';
  late Dio _dio;
  var options;

  // Getters for API end-points
  static String get loginEndpoint => 'login';
  static String get registerEndpoint => 'register';
  static String get resetPassEndpoint => 'resetpass';
  static String get leaderboardEndpoint => 'leaderboard';
  static String get allCommunitiesEndpoint => 'community/all';
  static String get profileEndpoint => 'user/O0dtUv8DM2b2qEn7aiFBcfe3KOu2';
  static String get forumQuestionEndpoint => 'forumQuestion';
  Api() {
    options = BaseOptions(
      baseUrl: baseUrl,
    );
    _dio = new Dio(options);
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>?> GET(String path) async {
    debugPrint(baseUrl);
    debugPrint(path);
    Response<dynamic>? response;
    try {
      response = await _dio.get(path);
      // debugPrint(response.toString());
    } on SocketException catch (e) {
      print("Socket exception:");
      print(e);
    } on DioError catch (e) {
      print(e);
      print(e.response);
      if (e.type == DioErrorType.response) {
        return e.response;
      } else
        return null;
    } on FormatException catch (e) {
      print("Server returned an invalid response");
      print(e.message);
    }
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>?> POST(
      String path, Map<String, dynamic> body) async {
    Response<dynamic>? response;
    try {
      print(path);
      print(baseUrl);
      print(ServiceLocator<UserService>().uid);
      response = await _dio.post(
        path,
        data: body,
        options: Options(
          headers: <String, dynamic>{
            'uid': ServiceLocator<UserService>().uid,
          },
        ),
      );
      print(response);
    } on SocketException catch (e) {
      print(e);
    } on DioError catch (e) {
      print(e);
      if (e.type == DioErrorType.response) {
        return e.response;
      } else
        return null;
    } on FormatException catch (e) {
      print("Server returned an invalid response");
      print(e.message);
    }
    return response;
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>?> PUT(String path, Map<String, dynamic> body) async {
    print(path);
    Response<dynamic>? response;

    try {
      response = await _dio.put(path, data: body);
      print(response);
    } on SocketException catch (e) {
      print("Socket exception:");
      print(e);
    } on DioError catch (e) {
      print("DioError:");
      print(e);
      if (e.type == DioErrorType.response) {
        print(e.type);
        return e.response;
      } else
        return null;
    } on FormatException catch (e) {
      print("Server returned an invalid response");
      print(e.message);
    }
    return response;
  }
}

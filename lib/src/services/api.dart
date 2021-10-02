import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  static String baseUrl = 'http://aakashp.freemyip.com/re-member-server/';
  late Dio _dio;
  var options;

  // Getters for API end-points
  static String get loginEndpoint => 'login';
  static String get registerEndpoint => 'register';
  static String get leaderboardEndpoint => 'leaderboard';
  static String get allCommunitiesEndpoint => 'community/all';
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
      debugPrint(response.toString());
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
      response = await _dio.post(path, data: body);
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

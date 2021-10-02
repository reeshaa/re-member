import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

class Api {
  static String baseUrl = '';
  late Dio _dio;
  var options;
  static const token =
      'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVUTRNemhDUVVWQk1rTkJNemszUTBNMlFVVTRRekkyUmpWQ056VTJRelUxUTBVeE5EZzFNUSJ9.eyJodHRwczovL3BsYXRmb3JtLnN5bWJsLmFpL3VzZXJJZCI6IjUwODUyMTQxMTcxOTk4NzIiLCJpc3MiOiJodHRwczovL2RpcmVjdC1wbGF0Zm9ybS5hdXRoMC5jb20vIiwic3ViIjoiRnBhcW5zajJsekh6dFlZekZ1V21scnNQWjh3NHo1bUtAY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8vcGxhdGZvcm0ucmFtbWVyLmFpIiwiaWF0IjoxNjI3MTk2OTEzLCJleHAiOjE2MjcyODMzMTMsImF6cCI6IkZwYXFuc2oybHpIenRZWXpGdVdtbHJzUFo4dzR6NW1LIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.OAQDDhlfx3d0plBaaoph0RqVSIPdYC7ZgSywCxYb_MjYTbqilYauuEnZBB_TdBd4D0xLwnIx_zYhXViDcqsgESJrQGQXsEgwS5rgmjnwX7NxeV_LxjzkwRZF24WrzPj9qHjXGQ0Ec0GH8KNthxqxTjvhWQ8YG0qQrtOo8F9Xn7mhtk9bzGHxjCEP3mDAj2F9Srae483OqbYYht1f4oS1U0BavFXcyqcd3Xbp_GoQtw5NZKbYt_ZUWy7Xy8QDgqE8BQK8dhivC7HBvXkF39GLsCSU8KKqMGvL4xtUmJmdWzZmsXl_HEKUdssTBKp4kRr9eOcAIbkzivhtKbpYj_j1-g';

  String _authToken = 'Bearer $token';

  /// Add Authorization header
  set authToken(String token) {
    _authToken = token;
    if (token.isNotEmpty) {
      _dio.options.headers = <String, dynamic>{
        "Content-Type": 'application/json',
        "Authorization": _authToken,
      };
    }
  }

  // Getters for API end-points
  static String get loginEndpoint => '/login';
  Api() {
    options = BaseOptions(
      baseUrl: baseUrl,
    );
    _dio = new Dio(options);
  }

  // ignore: non_constant_identifier_names
  Future<Response<dynamic>?> GET(String path) async {
    // debugPrint(path);
    Response<dynamic>? response;
    try {
      response = await _dio.get(path);
      // debugPrint(response);
    } on SocketException catch (e) {
      print("Socket exception:");
      print(e);
    } on DioError catch (e) {
      print("DioError");
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
    print(path);
    _dio.options.headers = <String, dynamic>{
      "Content-Type": 'application/json',
      "Authorization": _authToken,
    };

    Response<dynamic>? response;
    try {
      response = await _dio.post(path, data: body);
      // print(response);
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

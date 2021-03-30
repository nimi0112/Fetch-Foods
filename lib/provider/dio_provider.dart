import 'dart:io';

import 'package:dio/dio.dart';

import '../constants.dart';

class DioProvider {
  // private constructor restricted to this class itself
  DioProvider._();

  static Dio _dio;

  // App wide general request.
  static Dio getInstance() {
    if (_dio != null) {
      return _dio;
    }
    _dio = Dio();

    final BaseOptions dioOptions = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      receiveTimeout: RECEIVE_TIMEOUT,
    )
      ..baseUrl = BASE_URL
      ..contentType = Headers.jsonContentType
      //setting custom headers
      ..headers[DEVICE_TYPE] = Platform.operatingSystem.toLowerCase();

    _dio.options = dioOptions;
    _dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));

    return _dio;
  }
}

import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../constants/app_constants.dart';
import 'api_interceptors.dart';

class DioClient {
  DioClient._();

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(
          seconds: AppConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          seconds: AppConstants.receiveTimeout,
        ),
        sendTimeout: const Duration(
          seconds: AppConstants.requestTimeout,
        ),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(ApiInterceptors());

    return dio;
  }
}
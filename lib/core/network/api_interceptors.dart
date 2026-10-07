import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add token here later.
    //
    // Example:
    // options.headers['Authorization'] = 'Bearer $token';

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}

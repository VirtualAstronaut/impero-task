import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:impero_task/api_service/endpoints.dart';

class DioService {
  static late Dio _dio;
  static Dio get dio => _dio;
  static void init() {
    _dio = Dio();
    dio.interceptors.add(BaseUrlInterceptor());
  }
}

class BaseUrlInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log('Request fetched ${{options.path}}');
    if (!options.path.startsWith(EndPoints.baseUrl)) {
      options.path = EndPoints.baseUrl + options.path;
      options.headers = {
        "Accept": "application/json",
        "Content-Type": "application/json"
      };
    }

    return super.onRequest(options, handler);
  }
}

import 'package:dio/dio.dart';
import 'package:van_dog/config/env/app_environment.dart';

class ApiService {
  final Dio _dio = Dio();
  static final ApiService instance = ApiService._privateConstructor();

  ApiService._privateConstructor() {
    _dio.options.baseUrl = AppEnvironment.apiUrl;
    _dio.options.headers['x-api-key'] = AppEnvironment.apiKey;

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );
  }

  Future<Response> get(String url) async {
    return await _dio.get(url);
  }
}

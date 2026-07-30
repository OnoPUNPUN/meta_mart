import 'package:dio/dio.dart';
import 'package:meta_mart/core/network/token_manager.dart';

class DioProvider {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  static Dio createDio(TokenManager tokenManager) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final isAuthRequest = options.path.startsWith('/auth/');

          if (!isAuthRequest) {
            final token = await tokenManager.getAccessToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }

          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return dio;
  }
}

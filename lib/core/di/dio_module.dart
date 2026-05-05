import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:quiniela_flutter/core/config/app_config.dart';
import 'package:quiniela_flutter/core/utils/auth_token_holder.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(AuthTokenHolder tokenHolder) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = tokenHolder.token;
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
    return dio;
  }
}

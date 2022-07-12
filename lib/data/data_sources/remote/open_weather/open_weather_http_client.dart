import 'package:dio/dio.dart';
import 'package:flutter_course_2022/core/networking/base_http_client.dart';

class OpenWeatherHttpClient extends BaseHttpClient {
  OpenWeatherHttpClient({
    required String baseUrl,
    required String apiKey,
    required int receiveTimeout,
    required int connectTimeout,
  }) : super(
          baseUrl: baseUrl,
          receiveTimeout: receiveTimeout,
          connectTimeout: connectTimeout,
        ) {
    dio.interceptors.add(
      OpenWeatherKeyInterceptor(apiKey),
    );
  }
}

class OpenWeatherKeyInterceptor extends Interceptor {
  final String apiKey;

  OpenWeatherKeyInterceptor(this.apiKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters['appid'] = apiKey;
    super.onRequest(options, handler);
  }
}

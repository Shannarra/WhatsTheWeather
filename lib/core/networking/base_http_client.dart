import 'package:dio/dio.dart';

abstract class BaseHttpClient {
  final Dio dio;

  BaseHttpClient({
    required String baseUrl,
    required int receiveTimeout,
    required int connectTimeout,
  }) : dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            receiveTimeout: receiveTimeout,
            connectTimeout: connectTimeout,
            contentType: Headers.jsonContentType,
            headers: <String, dynamic>{
              Headers.acceptHeader: 'application/json',
            },
          ),
        );

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
  }) async {
    return dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
    dynamic data,
  }) async {
    return dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        responseType: responseType,
      ),
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
    dynamic data,
  }) async {
    return dio.put(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        responseType: responseType,
      ),
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
    dynamic data,
  }) async {
    return dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
      ),
    );
  }
}

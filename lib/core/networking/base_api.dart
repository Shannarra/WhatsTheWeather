import 'package:flutter/foundation.dart';
import 'package:flutter_course_2022/core/networking/base_http_client.dart';
import 'package:flutter_course_2022/core/networking/request.dart';
import 'package:flutter_course_2022/core/networking/result.dart';

abstract class BaseApi {
  BaseApi(this.httpClient);

  final BaseHttpClient httpClient;

  @protected
  Future<Result<T>> makeRequest<T>(
    RequestModel model, {
    T Function(dynamic)? mapper,
  }) async {
    try {
      dynamic json;
      switch (model.type) {
        case MethodType.get:
          json = (await httpClient.get<dynamic>(
            model.path,
            queryParameters: model.queryParameters,
            responseType: model.responseType,
          ))
              .data;
          break;
        case MethodType.post:
          json = (await httpClient.post<dynamic>(
            model.path,
            queryParameters: model.queryParameters,
            responseType: model.responseType,
            data: model.body,
          ))
              .data;
          break;
        case MethodType.put:
          json = (await httpClient.put<dynamic>(
            model.path,
            queryParameters: model.queryParameters,
            responseType: model.responseType,
            data: model.body,
          ))
              .data;
          break;
        case MethodType.delete:
          json = (await httpClient.delete<dynamic>(
            model.path,
            queryParameters: model.queryParameters,
            responseType: model.responseType,
            data: model.body,
          ))
              .data;
      }
      if (mapper != null) {
        return Result<T>.success(mapper(json));
      } else {
        return Result<T>.success(json as T);
      }
    } catch (e) {
      return Result<T>.error(e);
    }
  }
}

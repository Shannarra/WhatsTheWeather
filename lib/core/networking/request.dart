import 'package:dio/dio.dart';

enum MethodType {
  get,
  post,
  put,
  delete,
}

abstract class RequestModel {
  MethodType get type;

  String get path;

  Map<String, dynamic>? get queryParameters => <String, dynamic>{};

  dynamic get body => null;

  ProgressCallback? get onReceiveProgress => null;

  CancelToken? get cancelToken => null;

  ResponseType? get responseType => null;
}

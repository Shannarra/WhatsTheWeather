import 'package:flutter_course_2022/core/networking/request.dart';

class GeocodingRequest extends RequestModel {
  final String query;

  GeocodingRequest({
    required this.query,
  });

  @override
  String get path => '/geo/1.0/direct';

  @override
  MethodType get type => MethodType.get;

  @override
  Map<String, dynamic>? get queryParameters => <String, dynamic>{'q': query};
}

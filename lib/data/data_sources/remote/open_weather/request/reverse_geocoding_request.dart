import 'package:flutter_course_2022/core/networking/request.dart';

class ReverseGeocodingRequest extends RequestModel {
  final double latitude;
  final double longitude;

  ReverseGeocodingRequest({
    required this.latitude,
    required this.longitude,
  });

  @override
  String get path => '/geo/1.0/reverse';

  @override
  MethodType get type => MethodType.get;

  @override
  Map<String, dynamic>? get queryParameters => <String, dynamic>{
        'lat': latitude,
        'lon': longitude,
      };
}

import 'package:flutter_course_2022/core/networking/request.dart';

class WeatherRequest extends RequestModel {
  final double latitude;
  final double longitude;

  WeatherRequest({
    required this.latitude,
    required this.longitude,
  });

  @override
  String get path => '/data/2.5/onecall';

  @override
  MethodType get type => MethodType.get;

  @override
  Map<String, dynamic>? get queryParameters => <String, dynamic>{
        'lat': latitude,
        'lon': longitude,
        'exclude': 'minutely',
      };
}

import 'package:flutter_course_2022/application/models/constants/weather_status.dart';

class HourlyForecastModel {
  final int unixTime;
  final double temperature;
  final double pop;
  final WeatherStatus status;

  const HourlyForecastModel({
    required this.unixTime,
    required this.temperature,
    required this.pop,
    required this.status,
  });
}

import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/current_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/daily_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/hourly_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/weather_alert_dto.dart';

class ForecastResponse {
  final CurrentWeatherDto current;
  final List<HourlyWeatherDto> hourly;
  final List<DailyWeatherDto> daily;
  final List<WeatherAlertDto> alerts;

  const ForecastResponse({
    required this.current,
    required this.hourly,
    required this.daily,
    required this.alerts,
  });

  factory ForecastResponse.fromJson(dynamic json) {
    final ForecastResponse response = ForecastResponse(
      current:
          CurrentWeatherDto.fromMap(json['current'] as Map<String, dynamic>),
      hourly: (json['hourly'] as List<dynamic>)
          .map<HourlyWeatherDto>(
            (dynamic e) => HourlyWeatherDto.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
      daily: (json['daily'] as List<dynamic>)
          .map<DailyWeatherDto>(
            (dynamic e) => DailyWeatherDto.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
      alerts: ((json['alerts'] ?? <WeatherAlertDto>[]) as List<dynamic>)
          .map<WeatherAlertDto>(
            (dynamic e) => WeatherAlertDto.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
    );
    return response;
  }
}

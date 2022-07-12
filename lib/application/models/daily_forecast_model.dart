import 'package:flutter_course_2022/application/models/constants/weather_status.dart';
import 'package:flutter_course_2022/application/models/hourly_forecast_model.dart';

class DailyForecastModel {
  final int unixTime;
  final int unixSunrise;
  final int unixSunset;
  final double? currentTemperature;
  final double minTemperature;
  final double maxTemperature;
  final WeatherStatus status;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int clouds;
  final int? visibility;
  final double windSpeed;
  final int windDeg;
  final double? pop;
  final double? rain;
  final double? snow;
  final double? uvi;
  final List<HourlyForecastModel> hourly;

  const DailyForecastModel({
    required this.unixTime,
    required this.unixSunrise,
    required this.unixSunset,
    this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.status,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.clouds,
    this.visibility,
    required this.windSpeed,
    required this.windDeg,
    this.pop,
    this.rain,
    this.snow,
    this.uvi,
    required this.hourly,
  });

  DailyForecastModel copyWith({
    int? unixTime,
    int? unixSunrise,
    int? unixSunset,
    double? currentTemperature,
    double? minTemperature,
    double? maxTemperature,
    WeatherStatus? status,
    int? pressure,
    int? humidity,
    double? dewPoint,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? pop,
    double? rain,
    double? snow,
    double? uvi,
    List<HourlyForecastModel>? hourly,
  }) {
    return DailyForecastModel(
      unixTime: unixTime ?? this.unixTime,
      unixSunrise: unixSunrise ?? this.unixSunrise,
      unixSunset: unixSunset ?? this.unixSunset,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      minTemperature: minTemperature ?? this.minTemperature,
      maxTemperature: maxTemperature ?? this.maxTemperature,
      status: status ?? this.status,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      uvi: uvi ?? this.uvi,
      hourly: hourly ?? this.hourly,
    );
  }
}

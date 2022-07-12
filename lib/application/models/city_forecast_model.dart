import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/application/models/daily_forecast_model.dart';
import 'package:flutter_course_2022/application/models/weather_alert_model.dart';

class CityForecastModel {
  final CityModel? cityModel;
  final DailyForecastModel todayModel;
  final List<DailyForecastModel> nextDaysModel;
  final List<WeatherAlertModel> alerts;

  const CityForecastModel({
    this.cityModel,
    required this.todayModel,
    required this.nextDaysModel,
    required this.alerts,
  });

  CityForecastModel copyWith({
    CityModel? cityModel,
    DailyForecastModel? todayModel,
    List<DailyForecastModel>? nextDaysModel,
    List<WeatherAlertModel>? alerts,
  }) {
    return CityForecastModel(
      cityModel: cityModel ?? this.cityModel,
      todayModel: todayModel ?? this.todayModel,
      nextDaysModel: nextDaysModel ?? this.nextDaysModel,
      alerts: alerts ?? this.alerts,
    );
  }
}

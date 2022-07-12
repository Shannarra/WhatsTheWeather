import 'package:flutter/material.dart';
import 'package:flutter_course_2022/presentation/view_models/weather_status_view_model.dart';
import 'package:flutter_course_2022/utils/time_utils.dart';

class HourlyForecastViewModel {
  final int unixTime;
  final String temperature;
  final double pop;
  final WeatherStatusViewModel statusViewModel;
  HourlyForecastViewModel({
    required this.unixTime,
    required this.temperature,
    required this.pop,
    required this.statusViewModel,
  });

  
  String formattedTime(Locale locale) =>
      TimeUtils.formatJmUnix(unixTime, locale.countryCode);

 }

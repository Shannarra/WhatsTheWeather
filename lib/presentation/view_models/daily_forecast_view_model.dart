import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/view_models/hourly_forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/view_models/weather_status_view_model.dart';
import 'package:flutter_course_2022/utils/extensions/int_extensions.dart';
import 'package:flutter_course_2022/utils/extensions/list_extensions.dart';
import 'package:flutter_course_2022/utils/time_utils.dart';

class DailyForecastViewModel {
  final int unixTime;
  final int unixSunrise;
  final int unixSunset;
  late int? unixMaxTemperature;
  final String? currentTemperature;
  final String minTemperature;
  final String maxTemperature;
  final WeatherStatusViewModel statusViewModel;
  final int pressure;
  final int humidity;
  final int clouds;
  final double windSpeed;
  final double? pop;
  final double? rain;
  final double? snow;
  final double? uvi;
  final List<HourlyForecastViewModel> hourly;

  HourlyForecastViewModel? _rainyHour;
  late List<MapEntry<String, String>> details;

  DailyForecastViewModel({
    required this.unixTime,
    required this.unixSunrise,
    required this.unixSunset,
    this.unixMaxTemperature,
    this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.statusViewModel,
    required this.pressure,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
    this.pop,
    this.rain,
    this.snow,
    this.uvi,
    required this.hourly,
  }) {
    details = <MapEntry<String, String>?>[
      formattedPressure,
      formattedHumidity,
      formattedCloudiness,
      formattedWindSpeed,
      formattedProbabilityPrecipation,
      formattedRain,
      formattedSnow,
      formattedUvi,
    ]
        .where((MapEntry<String, String>? element) => element != null)
        .map((MapEntry<String, String>? e) => e!)
        .toList();
  }

  String dateTitle(Locale locale) {
    final DateTime now = DateTime.now();
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(unixTime);
    final int diffDays = TimeUtils.differenceInDays(now, time);

    if (diffDays == 0) {
      return t.weather.today_date(date: formattedDateAndYear(locale));
    }

    if (diffDays == 1) {
      return t.weather.tomorrow_date(date: formattedDateAndYear(locale));
    }

    return formattedDateAndYear(locale);
  }

  String formattedDate(Locale locale) =>
      TimeUtils.formatMdUnix(unixTime, locale.countryCode);

  String formattedDateAndYear(Locale locale) =>
      TimeUtils.formatYMMMMdUnix(unixTime, locale.countryCode);

  String formattedSunrise(Locale locale) =>
      TimeUtils.formatJmUnix(unixSunrise, locale.countryCode);

  String formattedSunset(Locale locale) =>
      TimeUtils.formatJmUnix(unixSunset, locale.countryCode);

  String? formattedMaxTemperatureTime(Locale locale) =>
      unixMaxTemperature == null
          ? null
          : TimeUtils.formatJmUnix(unixMaxTemperature!, locale.countryCode);

  MapEntry<String, String> get formattedPressure => MapEntry<String, String>(
        t.weather.detail_items.pressure,
        '$pressure hPa',
      );

  MapEntry<String, String> get formattedHumidity =>
      MapEntry<String, String>(t.weather.detail_items.humidity, '$humidity%');

  MapEntry<String, String> get formattedCloudiness =>
      MapEntry<String, String>(t.weather.detail_items.cloudiness, '$clouds%');

  MapEntry<String, String> get formattedWindSpeed => MapEntry<String, String>(
        t.weather.detail_items.windspeed,
        '$windSpeed m/s',
      );

  MapEntry<String, String>? get formattedProbabilityPrecipation => pop == null
      ? null
      : MapEntry<String, String>(
          t.weather.detail_items.pop,
          '${(pop! * 100).round()}%',
        );

  MapEntry<String, String>? get formattedRain => rain == null
      ? null
      : MapEntry<String, String>(
          t.weather.detail_items.rain,
          '${rain!.toStringAsFixed(1)} mm',
        );

  MapEntry<String, String>? get formattedSnow => snow == null
      ? null
      : MapEntry<String, String>(
          t.weather.detail_items.snow,
          '${snow!.toStringAsFixed(1)} mm',
        );

  MapEntry<String, String>? get formattedUvi => uvi == null
      ? null
      : MapEntry<String, String>(
          t.weather.detail_items.uvi,
          '$uviIndexSeverity, ${uvi!.round()}',
        );

  HourlyForecastViewModel? get firstRainyHour {
    _rainyHour ??=
        hourly.firstWhereOrNull((HourlyForecastViewModel e) => e.pop > 0.6);
    return _rainyHour;
  }

  String? get uviIndexSeverity {
    if (uvi == null) {
      return null;
    }

    final int rounded = uvi!.round();

    if (rounded.inRangeInclusive(lower: 0, upper: 2)) {
      return t.weather.uv_name.low;
    }

    if (rounded.inRangeInclusive(lower: 3, upper: 5)) {
      return t.weather.uv_name.moderate;
    }

    if (rounded.inRangeInclusive(lower: 6, upper: 7)) {
      return t.weather.uv_name.high;
    }

    if (rounded.inRangeInclusive(lower: 8, upper: 10)) {
      return t.weather.uv_name.very_high;
    }

    return t.weather.uv_name.extreme;
  }
}

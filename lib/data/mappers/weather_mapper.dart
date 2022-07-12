import 'package:flutter_course_2022/application/models/constants/weather_status.dart';
import 'package:flutter_course_2022/application/models/daily_forecast_model.dart';
import 'package:flutter_course_2022/application/models/hourly_forecast_model.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/current_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/daily_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/hourly_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/weather_status_dto.dart';
import 'package:flutter_course_2022/utils/extensions/int_extensions.dart';

class WeatherMapper {
  static const int _secondsToMillisecondsMultiplier = 1000;

  static DailyForecastModel currentToModel(
    CurrentWeatherDto dto,
    num minTemp,
    num maxTemp,
  ) =>
      DailyForecastModel(
        unixTime: dto.dt * _secondsToMillisecondsMultiplier,
        unixSunrise: dto.sunrise * _secondsToMillisecondsMultiplier,
        unixSunset: dto.sunset * _secondsToMillisecondsMultiplier,
        currentTemperature: dto.temp.toDouble(),
        minTemperature: minTemp.toDouble(),
        maxTemperature: maxTemp.toDouble(),
        status: _dtoToStatus(dto.weatherStatusDto),
        pressure: dto.pressure,
        humidity: dto.humidity,
        dewPoint: dto.dewPoint.toDouble(),
        clouds: dto.clouds,
        visibility: dto.visibility,
        windSpeed: dto.windSpeed.toDouble(),
        windDeg: dto.windDeg,
        uvi: dto.uvi.toDouble(),
        hourly: List<HourlyForecastModel>.empty(),
      );

  static DailyForecastModel dailyDtoToModel(DailyWeatherDto dto) =>
      DailyForecastModel(
        unixTime: dto.dt * _secondsToMillisecondsMultiplier,
        unixSunrise: dto.sunrise * _secondsToMillisecondsMultiplier,
        unixSunset: dto.sunset * _secondsToMillisecondsMultiplier,
        minTemperature: dto.temp.min.toDouble(),
        maxTemperature: dto.temp.max.toDouble(),
        status: _dtoToStatus(dto.weather),
        pressure: dto.pressure,
        humidity: dto.humidity,
        dewPoint: dto.dewPoint.toDouble(),
        clouds: dto.clouds,
        windSpeed: dto.windSpeed.toDouble(),
        windDeg: dto.windDeg,
        pop: dto.pop?.toDouble(),
        rain: dto.rain?.toDouble(),
        snow: dto.snow?.toDouble(),
        uvi: dto.uvi?.toDouble(),
        hourly: List<HourlyForecastModel>.empty(growable: false),
      );

  static HourlyForecastModel dtoToHourlyModel(HourlyWeatherDto dto) =>
      HourlyForecastModel(
        unixTime: dto.dt * _secondsToMillisecondsMultiplier,
        temperature: dto.temp.toDouble(),
        pop: dto.pop.toDouble(),
        status: _dtoToStatus(dto.statusDto),
      );

  static WeatherStatus _dtoToStatus(WeatherStatusDto dto) {
    if (dto.id.inRangeInclusive(lower: 200, upper: 232)) {
      return WeatherStatus.thunderstorm;
    }

    if (dto.id.inRangeInclusive(lower: 300, upper: 399)) {
      return WeatherStatus.drizzle;
    }

    if (dto.id.inRangeInclusive(lower: 500, upper: 599)) {
      return WeatherStatus.rain;
    }

    if (dto.id.inRangeInclusive(lower: 600, upper: 602) ||
        dto.id.inRangeInclusive(lower: 616, upper: 699)) {
      return WeatherStatus.snow;
    }

    if (dto.id.inRangeInclusive(lower: 611, upper: 613)) {
      return WeatherStatus.sleet;
    }

    if (dto.id.inRangeInclusive(lower: 700, upper: 799)) {
      return WeatherStatus.dust;
    }

    if (dto.id == 800) {
      return WeatherStatus.clear;
    }

    if (dto.id.inRangeInclusive(lower: 801, upper: 803)) {
      return WeatherStatus.clouds;
    }

    if (dto.id == 804) {
      return WeatherStatus.overcast;
    }

    return WeatherStatus.unknown;
  }
}

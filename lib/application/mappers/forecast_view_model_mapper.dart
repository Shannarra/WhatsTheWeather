import 'package:flutter_course_2022/application/models/city_forecast_model.dart';
import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:flutter_course_2022/application/models/constants/weather_status.dart';
import 'package:flutter_course_2022/application/models/daily_forecast_model.dart';
import 'package:flutter_course_2022/application/models/hourly_forecast_model.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:flutter_course_2022/presentation/view_models/daily_forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/view_models/forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/view_models/hourly_forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/view_models/weather_status_view_model.dart';

class ForecastViewModelMapper {
  static ForecastViewModel forecastViewModelFromData(
    CityViewModel city,
    CityForecastModel model,
    TemperatureUnit unit,
  ) =>
      ForecastViewModel(
        location: city,
        today: _dailyViewModelFromModelAndUnit(model.todayModel, unit),
        otherDays: model.nextDaysModel
            .map(
              (DailyForecastModel e) =>
                  _dailyViewModelFromModelAndUnit(e, unit),
            )
            .toList(),
      );

  static DailyForecastViewModel _dailyViewModelFromModelAndUnit(
    DailyForecastModel model,
    TemperatureUnit unit,
  ) {
    //get the maximum temperature hour
    final HourlyForecastModel? maxTemperatureHour = model.hourly.isEmpty
        ? null
        : model.hourly.reduce(
            (HourlyForecastModel value, HourlyForecastModel element) =>
                value.temperature > element.temperature ? value : element,
          );

    return DailyForecastViewModel(
      unixTime: model.unixTime,
      unixSunrise: model.unixSunrise,
      unixSunset: model.unixSunset,
      unixMaxTemperature: maxTemperatureHour?.unixTime,
      currentTemperature: model.currentTemperature == null
          ? null
          : unit.convert(model.currentTemperature!),
      minTemperature: unit.convert(model.minTemperature),
      maxTemperature: unit.convert(model.maxTemperature),
      statusViewModel: _statusViewModelFromStatus(model.status),
      pressure: model.pressure,
      humidity: model.humidity,
      clouds: model.clouds,
      windSpeed: model.windSpeed,
      pop: model.pop,
      rain: model.rain,
      snow: model.snow,
      uvi: model.uvi,
      hourly: model.hourly
          .map(
            (HourlyForecastModel e) =>
                _hourlyViewModelFromModelAndUnit(e, unit),
          )
          .toList(),
    );
  }

  static HourlyForecastViewModel _hourlyViewModelFromModelAndUnit(
    HourlyForecastModel model,
    TemperatureUnit unit,
  ) =>
      HourlyForecastViewModel(
        unixTime: model.unixTime,
        temperature: unit.convert(model.temperature),
        pop: model.pop,
        statusViewModel: _statusViewModelFromStatus(model.status),
      );

  static WeatherStatusViewModel _statusViewModelFromStatus(WeatherStatus s) =>
      WeatherStatusViewModel(
        status: s,
      );
}

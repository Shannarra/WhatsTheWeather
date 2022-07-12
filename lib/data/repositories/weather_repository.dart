import 'package:flutter_course_2022/application/models/city_forecast_model.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/application/models/daily_forecast_model.dart';
import 'package:flutter_course_2022/application/models/hourly_forecast_model.dart';
import 'package:flutter_course_2022/application/models/weather_alert_model.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/data_sources/local/memory/cache_data/coordinate_cache_key.dart';
import 'package:flutter_course_2022/data/data_sources/local/memory/forecast_cache.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/daily_weather_dto.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/forecast_response.dart';
import 'package:flutter_course_2022/data/mappers/alert_mapper.dart';
import 'package:flutter_course_2022/data/mappers/weather_mapper.dart';

abstract class WeatherRepository {
  Future<Result<CityForecastModel>> forecastForCity(CityModel model);
}

class WeatherRepositoryImplementation extends WeatherRepository {
  final OpenWeatherApi _openWeatherApi;
  final ForecastCache _forecastCache;

  WeatherRepositoryImplementation(this._openWeatherApi, this._forecastCache);

  @override
  Future<Result<CityForecastModel>> forecastForCity(CityModel model) async {
    final CoordinatesCacheKey cacheKey = CoordinatesCacheKey(
      latitude: model.latitude,
      longitude: model.longitude,
    );

    final ForecastResponse? cacheEntry = _forecastCache.get(cacheKey);

    if (cacheEntry != null) {
      return Result<CityForecastModel>.success(
        _mapResponseToForecastModel(cacheEntry),
      );
    }

    final Result<ForecastResponse> apiResult =
        await _openWeatherApi.getCurrentWeather(
      latitude: model.latitude,
      longitude: model.longitude,
    );

    if (apiResult.isSuccess) {
      _forecastCache.put(cacheKey, apiResult.toSuccess().data);
    }

    return apiResult.map(_mapResponseToForecastModel);
  }

  CityForecastModel _mapResponseToForecastModel(ForecastResponse response) {
    final DailyWeatherDto today = response.daily.first;
    final Iterable<DailyWeatherDto> otherDays = response.daily.skip(1);

    final List<WeatherAlertModel> alertModels =
        response.alerts.map(AlertMapper.dtoToModel).toList();

    final List<HourlyForecastModel> hourlyModels =
        response.hourly.map(WeatherMapper.dtoToHourlyModel).toList();

    final List<DailyForecastModel> dailyModels =
        otherDays.map(WeatherMapper.dailyDtoToModel).toList();

    DailyForecastModel todayModel = WeatherMapper.currentToModel(
      response.current,
      today.temp.min,
      today.temp.max,
    );

    todayModel = todayModel.copyWith(hourly: hourlyModels);

    return CityForecastModel(
      todayModel: todayModel,
      nextDaysModel: dailyModels,
      alerts: alertModels,
    );
  }
}

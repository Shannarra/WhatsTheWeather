import 'dart:convert';
import 'dart:io';

import 'package:flutter_course_2022/application/models/city_forecast_model.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/data_sources/local/memory/forecast_cache.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/forecast_response.dart';
import 'package:flutter_course_2022/data/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_repository_test.mocks.dart';

@GenerateMocks(<Type>[OpenWeatherApi])
void main() {
  late OpenWeatherApi api;
  late ForecastCache cache;

  late WeatherRepository repository;
  late CityModel model;
  late String testReponse;

  setUpAll(() async {
    api = MockOpenWeatherApi();
    cache = ForecastCache(expirationTime: const Duration(minutes: 15));

    repository = WeatherRepositoryImplementation(api, cache);

    model =   CityModel(
      name: 'Plovdiv',
      country: 'BG',
      latitude: 0,
      longitude: 0,
      localizations: <String, Object>{},
      selected: true,
    );


    final File file = File('${Directory.current.path}/test/test_resources/forecast_response.json');
    testReponse = await file.readAsString();
  });

  group('Weather forecast fetch test', () {
    test('Weather forecast test error', () async {
      clearInteractions(api);
      when(api.getCurrentWeather(latitude: 0, longitude: 0)).thenAnswer(
        (_) async => Result<ForecastResponse>.error('Unknown error'),
      );

      expect(
        await repository.forecastForCity(model),
        isInstanceOf<ResultError<CityForecastModel>>(),
      );

      verify(api.getCurrentWeather(latitude: 0, longitude: 0));
    });

    test('Weather forecast test success', () async {
      clearInteractions(api);
      when(api.getCurrentWeather(latitude: 0, longitude: 0)).thenAnswer(
        (_) async => Result<ForecastResponse>.success(
          ForecastResponse.fromJson(
            jsonDecode(testReponse),
          ),
        ),
      );

      expect(
        await repository.forecastForCity(model),
        isInstanceOf<ResultSuccess<CityForecastModel>>(),
      );

      verify(api.getCurrentWeather(latitude: 0, longitude: 0));
    });

    test('Cache test', () async {
      clearInteractions(api);

      expect(
        await repository.forecastForCity(model),
        isInstanceOf<ResultSuccess<CityForecastModel>>(),
      );

      verifyZeroInteractions(api);
    });
  });
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/daos/city_dao.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/city_list_response.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_resources/fake_city_dao.dart';
import 'city_repository_test.mocks.dart';

@GenerateMocks(<Type>[OpenWeatherApi])
void main() {
  late OpenWeatherApi api;
  late CityDao dao;

  late CityRepository repository;
  late CityModel testCity;

  late String testReponse;

  setUpAll(() async {
    api = MockOpenWeatherApi();
    dao = FakeCityDao();
    repository = CityRepositoryImplementation(api, dao);

    testCity =   CityModel(
      latitude: 0.0,
      country: 'Bg',
      state: 'Bg',
      localizations: <String, Object>{},
      name: 'Plovdiv',
      longitude: 0.0,
      selected: true,
    );

    final File file = File(
      '${Directory.current.path}/test/test_resources/cities_response.json',
    );
    testReponse = await file.readAsString();
  });

  group('`Search city by query test`', () {
    test('Search for city test success', () async {
      when(api.geocoding(query: 'Plovdiv')).thenAnswer(
        (_) async => Result<CitiesResponse>.success(
          CitiesResponse.fromJson(jsonDecode(testReponse)),
        ),
      );

      clearInteractions(api);

      expect(
        await repository.searchByQuery(query: "Plovdiv"),
        isInstanceOf<ResultSuccess<List<CityModel>>>(),
      );

      verify(api.geocoding(query: 'Plovdiv'));
    });

    test('Search for city test error', () async {
      when(api.geocoding(query: 'Plovdiv')).thenAnswer(
        (_) async => Result<CitiesResponse>.error('City not found'),
      );

      clearInteractions(api);

      expect(
        await repository.searchByQuery(query: "Plovdiv"),
        isInstanceOf<ResultError<List<CityModel>>>(),
      );

      verify(api.geocoding(query: 'Plovdiv'));
    });
  });

  group('`Search city by coordinates test`', () {

  });

  group('City Crud', () {
    test('Create a city', () async {
      final List<CityModel> data = await repository.savedCities().first;
      expect(data.isEmpty, true);

      await repository.putCity(model: testCity);

      final List<CityModel> newData = await repository.savedCities().first;

      expect(newData.isNotEmpty, true);
    });
    test('Delete a city', () async {
      await repository.putCity(model: testCity);
      final List<CityModel> data = await repository.savedCities().first;

      expect(data.isNotEmpty, true);

      await repository.deleteCity(model: testCity);
      final List<CityModel> newData = await repository.savedCities().first;

      expect(newData.isEmpty, true);
    });
  });
}

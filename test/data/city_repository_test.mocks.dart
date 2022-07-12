// Mocks generated by Mockito 5.1.0 from annotations
// in flutter_course_2022/test/data/city_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:flutter_course_2022/core/networking/base_http_client.dart'
    as _i2;
import 'package:flutter_course_2022/core/networking/request.dart' as _i8;
import 'package:flutter_course_2022/core/networking/result.dart' as _i3;
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart'
    as _i4;
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/city_list_response.dart'
    as _i7;
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/forecast_response.dart'
    as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeBaseHttpClient_0 extends _i1.Fake implements _i2.BaseHttpClient {}

class _FakeResult_1<T> extends _i1.Fake implements _i3.Result<T> {}

/// A class which mocks [OpenWeatherApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockOpenWeatherApi extends _i1.Mock implements _i4.OpenWeatherApi {
  MockOpenWeatherApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BaseHttpClient get httpClient =>
      (super.noSuchMethod(Invocation.getter(#httpClient),
          returnValue: _FakeBaseHttpClient_0()) as _i2.BaseHttpClient);
  @override
  _i5.Future<_i3.Result<_i6.ForecastResponse>> getCurrentWeather(
          {double? latitude, double? longitude}) =>
      (super.noSuchMethod(
              Invocation.method(#getCurrentWeather, [],
                  {#latitude: latitude, #longitude: longitude}),
              returnValue: Future<_i3.Result<_i6.ForecastResponse>>.value(
                  _FakeResult_1<_i6.ForecastResponse>()))
          as _i5.Future<_i3.Result<_i6.ForecastResponse>>);
  @override
  _i5.Future<_i3.Result<_i7.CitiesResponse>> geocoding({String? query}) =>
      (super.noSuchMethod(Invocation.method(#geocoding, [], {#query: query}),
              returnValue: Future<_i3.Result<_i7.CitiesResponse>>.value(
                  _FakeResult_1<_i7.CitiesResponse>()))
          as _i5.Future<_i3.Result<_i7.CitiesResponse>>);
  @override
  _i5.Future<_i3.Result<_i7.CitiesResponse>> reverseGeocoding(
          {double? latitude, double? longitude}) =>
      (super.noSuchMethod(
              Invocation.method(#reverseGeocoding, [],
                  {#latitude: latitude, #longitude: longitude}),
              returnValue: Future<_i3.Result<_i7.CitiesResponse>>.value(
                  _FakeResult_1<_i7.CitiesResponse>()))
          as _i5.Future<_i3.Result<_i7.CitiesResponse>>);
  @override
  _i5.Future<_i3.Result<T>> makeRequest<T>(_i8.RequestModel? model,
          {T Function(dynamic)? mapper}) =>
      (super.noSuchMethod(
              Invocation.method(#makeRequest, [model], {#mapper: mapper}),
              returnValue: Future<_i3.Result<T>>.value(_FakeResult_1<T>()))
          as _i5.Future<_i3.Result<T>>);
}
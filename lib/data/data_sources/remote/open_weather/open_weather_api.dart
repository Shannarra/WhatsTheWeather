import 'package:flutter_course_2022/core/networking/base_api.dart';
import 'package:flutter_course_2022/core/networking/base_http_client.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/request/geocoding_request.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/request/reverse_geocoding_request.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/request/weather_request.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/city_list_response.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/forecast_response.dart';

class OpenWeatherApi extends BaseApi {
  OpenWeatherApi(BaseHttpClient httpClient) : super(httpClient);

  Future<Result<ForecastResponse>> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) =>
      makeRequest(
        WeatherRequest(latitude: latitude, longitude: longitude),
        mapper: ForecastResponse.fromJson,
      );

  Future<Result<CitiesResponse>> geocoding({required String query}) =>
      makeRequest(
        GeocodingRequest(query: query),
        mapper: CitiesResponse.fromJson,
      );

  Future<Result<CitiesResponse>> reverseGeocoding({
    required double latitude,
    required double longitude,
  }) =>
      makeRequest(
        ReverseGeocodingRequest(latitude: latitude, longitude: longitude),
        mapper: CitiesResponse.fromJson,
      );
}

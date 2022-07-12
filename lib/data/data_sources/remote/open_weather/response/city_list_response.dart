import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/city_dto.dart';

class CitiesResponse {
  final List<CityDto> cities;

  const CitiesResponse({
    required this.cities,
  });

  factory CitiesResponse.fromJson(dynamic json) {
    return CitiesResponse(
      cities: (json as List<dynamic>)
          .map<CityDto>(
            (dynamic e) => CityDto.fromMap(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

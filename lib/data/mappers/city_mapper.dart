import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/city.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/city_dto.dart';

class CityMapper {
  static CityModel entityToModel(City city) => CityModel(
        name: city.name,
        country: city.country,
        latitude: double.parse(city.latitude),
        longitude: double.parse(city.longitude),
        localizations: city.localizations,
        selected: city.selected,
      );
  static CityModel dtoToModel(CityDto dto) => CityModel(
      name: dto.name,
      country: dto.country,
      latitude: dto.latitude,
      longitude: dto.longitude,
      localizations: dto.localizations.cast<String, Object>(),
      selected: false);

  static City modelToEntity(CityModel model) => City()
    ..id = model.id
    ..country = model.country
    ..name = model.name
    ..latitude = model.latitude.toString()
    ..longitude = model.longitude.toString()
    ..state = model.state
    ..selected = model.selected
    ..localizations = model.localizations;
}

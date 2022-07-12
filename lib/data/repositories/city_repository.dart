import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/daos/city_dao.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/city.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/city_list_response.dart';
import 'package:flutter_course_2022/data/mappers/city_mapper.dart';

abstract class CityRepository {
  Future<Result<List<CityModel>>> searchByQuery({required String query});

  Future<Result<List<CityModel>>> searchByCoordinates({
    required double latitude,
    required double longitude,
  });

  Stream<CityModel?> selectedCity();

  Stream<List<CityModel>> savedCities();

  Future<void> deselectAllCities();

  Future<void> putCity({required CityModel model});

  Future<void> deleteCity({required CityModel model});
}

class CityRepositoryImplementation extends CityRepository {
  final OpenWeatherApi _openWeatherApi;
  final CityDao _cityDao;

  CityRepositoryImplementation(this._openWeatherApi, this._cityDao);

  @override
  Future<void> deleteCity({required CityModel model}) => _cityDao.deleteCity(
        CityMapper.modelToEntity(model),
      );

  @override
  Future<void> putCity({required CityModel model}) => _cityDao.createOrUpdate(CityMapper.modelToEntity(model));

  @override
  Stream<List<CityModel>>  savedCities() => _cityDao.getAll().map(
        (List<City> e) => e.map(CityMapper.entityToModel).toList(),
      );

  @override
  Future<Result<List<CityModel>>> searchByCoordinates({
    required double latitude,
    required double longitude,
  })  async {
    final Result<CitiesResponse> result =
        await _openWeatherApi.reverseGeocoding(latitude: latitude, longitude: longitude);

    return result.map(
      (CitiesResponse data) => data.cities.map(CityMapper.dtoToModel).toList(),
    );
  }

  @override
  Future<Result<List<CityModel>>> searchByQuery({required String query}) async {
    final Result<CitiesResponse> result =
        await _openWeatherApi.geocoding(query: query);

    return result.map(
      (CitiesResponse data) => data.cities.map(CityMapper.dtoToModel).toList(),
    );
  }

  @override
  Future<void> deselectAllCities() => _cityDao.deselectAllCities();

  @override
  Stream<CityModel?> selectedCity() => _cityDao
      .selected()
      .map((City? e) => e == null ? null : CityMapper.entityToModel(e));
}

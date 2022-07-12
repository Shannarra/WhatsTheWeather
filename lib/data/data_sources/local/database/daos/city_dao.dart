import 'package:flutter/cupertino.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/city.dart';
import 'package:isar/isar.dart';

class CityDao {
  final Isar _db;

  CityDao(this._db);

  Stream<City?> selected() => _db.citys
      .filter()
      .selectedEqualTo(true)
      .limit(1)
      .watch(initialReturn: true)
      .map((List<City> e) => e.isEmpty ? null : e.first);

  Stream<List<City>> getAll() => _db.citys.where().watch(initialReturn: true);

  Future<void> deselectAllCities() => _db.writeTxn(
        (Isar isar) async {
          final List<City> cities =
              await isar.citys.filter().selectedEqualTo(true).findAll();

          for (City c in cities) {
            c.selected = false;
            isar.citys.put(c);
          }
        },
      );

  Future<void> deleteCity(City city) => _db.writeTxn(
        (Isar isar) async {
          //if the id is null we will check for record in our database in order to not create duplicate records
          city.id ??= await _findIdByLatitudeAndLongitude(
            instance: isar,
            latitude: city.latitude,
            longitude: city.longitude,
          );
          if (city.id != null ) {
              isar.citys.delete(city.id!);
          }
          
        },
      );

  Future<void> createOrUpdate(City city) => _db.writeTxn(
        (Isar isar) async {
          //if the id is null we will check for record in our database in order to not create duplicate records
          city.id ??= await _findIdByLatitudeAndLongitude(
            instance: isar,
            latitude: city.latitude,
            longitude: city.longitude,
          );

          isar.citys.put(city);
        },
      );

  Future<int?> _findIdByLatitudeAndLongitude({
    Isar? instance,
    required String latitude,
    required String longitude,
  }) async {
    final City? saved = await (instance ?? _db)
        .citys
        .where()
        .longitudeLatitudeEqualTo(longitude, latitude)
        .findFirst();

    return saved?.id;
  }
}

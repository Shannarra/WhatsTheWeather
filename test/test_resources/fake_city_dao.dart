import 'package:flutter_course_2022/data/data_sources/local/database/daos/city_dao.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/city.dart';
import 'package:flutter_course_2022/utils/extensions/list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

class FakeCityDao extends Fake implements CityDao {
  final List<City> _cities = List<City>.empty(growable: true);
  final BehaviorSubject<List<City>> _citySubject =
      BehaviorSubject<List<City>>();

  FakeCityDao() {
    _citySubject.add(_cities);
  }

  @override
  Stream<City?> selected() => _citySubject
      .map((List<City> e) => e.firstWhereOrNull((City e) => e.selected));

  @override
  Stream<List<City>> getAll() => _citySubject.stream;

  @override
  Future<void> deselectAllCities() async {
    for (City element in _cities) {
      element.selected = false;
    }

    _citySubject.add(_cities);
  }

  @override
  Future<void> createOrUpdate(City city) async {
    final int index = _cities.indexWhere(
      (City e) => e.latitude == city.latitude && e.longitude == city.longitude,
    );
    if (index > -1) {
      _cities[index] = city;
    } else {
      _cities.add(city);
    }

    _citySubject.add(_cities);
  }

  @override
  Future<void> deleteCity(City city) async {
    final int index = _cities.indexWhere(
      (City e) => e.latitude == city.latitude && e.longitude == city.longitude,
    );

    if (index > -1) {
      _cities.removeAt(index);
      _citySubject.add(_cities);
    }
  }
}

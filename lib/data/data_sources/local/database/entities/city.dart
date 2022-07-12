import 'package:flutter_course_2022/data/data_sources/local/database/converters/map_converter.dart';
import 'package:isar/isar.dart';

part 'city.g.dart';

@Collection()
class City {
  int? id;

  late String name;

  late String country;

  late String? state;

  late String latitude;

  @Index(composite: <CompositeIndex>[CompositeIndex('latitude')])
  late String longitude;

  late bool selected;

  @MapConverter()
  late Map<String, Object> localizations;
}

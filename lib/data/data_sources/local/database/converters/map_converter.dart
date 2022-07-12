import 'dart:convert';

import 'package:isar/isar.dart';

class MapConverter extends TypeConverter<Map<String, Object>, String> {
  const MapConverter();

  @override
  Map<String, Object> fromIsar(String object) {
    return jsonDecode(object).cast<String, Object>() as Map<String, Object>;
  }

  @override
  String toIsar(Map<String, Object> object) {
    return jsonEncode(object);
  }
}

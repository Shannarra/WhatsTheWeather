import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class Settings {
  static const String _unitsField = 'units';

  final RxSharedPreferences _instance;

  Settings(this._instance);

  Stream<TemperatureUnit?> get unit => _instance
      .getIntStream(_unitsField)
      .map((int? e) => e == null ? null : TemperatureUnit.values[e]);

  Future<void> setUnits(TemperatureUnit units) =>
      _instance.setInt(_unitsField, units.index);
}

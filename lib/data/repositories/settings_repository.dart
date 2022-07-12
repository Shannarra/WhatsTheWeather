import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:flutter_course_2022/data/data_sources/local/shared_preferences/settings.dart';

abstract class SettingsRepository {
  Stream<TemperatureUnit> getUnits();

  Future<void> setUnits(TemperatureUnit unit);
}

class SettingsRepositoryImplementation extends SettingsRepository {
  final Settings _settings;

  SettingsRepositoryImplementation(this._settings);

  @override
  Stream<TemperatureUnit> getUnits() =>
      _settings.unit.map((TemperatureUnit? e) => e ?? TemperatureUnit.celsius);

  @override
  Future<void> setUnits(TemperatureUnit unit) => _settings.setUnits(unit);
}

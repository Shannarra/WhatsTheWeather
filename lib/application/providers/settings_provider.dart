import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:flutter_course_2022/data/repositories/settings_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class SettingsProvider extends ChangeNotifier {
  TemperatureUnit get unit;

  set unit(TemperatureUnit unit);
}

class SettingsProviderImplementation extends SettingsProvider {
  final SettingsRepository _settingsRepository;

  late ValueStream<TemperatureUnit> _unitStream;
  late StreamSubscription<TemperatureUnit> _subscription;

  SettingsProviderImplementation(this._settingsRepository) {
    _unitStream = _settingsRepository
        .getUnits()
        .shareValueSeeded(TemperatureUnit.celsius);

    _subscription =
        _unitStream.listen((TemperatureUnit event) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  set unit(TemperatureUnit unit) {
    _settingsRepository.setUnits(unit);
  }

  @override
  TemperatureUnit get unit => _unitStream.value;
}

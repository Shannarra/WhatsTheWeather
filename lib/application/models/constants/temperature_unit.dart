enum TemperatureUnit {
  celsius,
  fahrenheit,
}

extension TemperatureUnitExtension on TemperatureUnit {
  static const double _kelvinCelsiusDiff = 273.15;

  String convert(double kelvin) {
    switch (this) {
      case TemperatureUnit.celsius:
        return '${_kelvinToCelsius(kelvin)}°C';
      case TemperatureUnit.fahrenheit:
        return '${_kelvinToFahrenheit(kelvin)}°F';
    }
  }

  ///° C= K - 273.15
  int _kelvinToCelsius(double kelvin) => (kelvin - _kelvinCelsiusDiff).round();

  ///° F = 9/5(K - 273) + 32
  int _kelvinToFahrenheit(double kelvin) =>
      (1.8 * (kelvin - _kelvinCelsiusDiff) + 32).round();
}

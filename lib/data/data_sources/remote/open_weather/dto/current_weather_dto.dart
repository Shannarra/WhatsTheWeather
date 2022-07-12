import 'dart:convert';

import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/weather_status_dto.dart';

class CurrentWeatherDto {
  final int dt;
  final int sunrise;
  final int sunset;
  final num temp;
  final num feelsLike;
  final int pressure;
  final int humidity;
  final num dewPoint;
  final num uvi;
  final int clouds;
  final int visibility;
  final num windSpeed;
  final int windDeg;
  final WeatherStatusDto weatherStatusDto;

  CurrentWeatherDto({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weatherStatusDto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'temp': temp,
      'feels_like': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'uvi': uvi,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'weather': weatherStatusDto.toMap(),
    };
  }

  factory CurrentWeatherDto.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherDto(
      dt: map['dt'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
      temp: map['temp'] as num,
      feelsLike: map['feels_like'] as num,
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      dewPoint: map['dew_point'] as num,
      uvi: map['uvi'] as num,
      clouds: map['clouds'] as int,
      visibility: map['visibility'] as int,
      windSpeed: map['wind_speed'] as num,
      windDeg: map['wind_deg'] as int,
      weatherStatusDto: WeatherStatusDto.fromMap(
        map['weather'][0] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherDto.fromJson(String source) =>
      CurrentWeatherDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/weather_status_dto.dart';
 
class HourlyWeatherDto {
  final int dt;
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
  final num? windGust;
  final WeatherStatusDto statusDto;
  final num pop;

  HourlyWeatherDto({
    required this.dt,
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
    this.windGust,
    required this.statusDto,
    required this.pop,
  });

  HourlyWeatherDto copyWith({
    int? dt,
    num? temp,
    num? feelsLike,
    int? pressure,
    int? humidity,
    num? dewPoint,
    num? uvi,
    int? clouds,
    int? visibility,
    num? windSpeed,
    int? windDeg,
    num? windGust,
     WeatherStatusDto ? statusDto,
    num? pop,
  }) {
    return HourlyWeatherDto(
      dt: dt ?? this.dt,
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      uvi: uvi ?? this.uvi,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      windGust: windGust ?? this.windGust,
      statusDto: statusDto ?? this.statusDto,
      pop: pop ?? this.pop,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
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
      'wind_gust': windGust,
      'weather': statusDto.toMap(),
      'pop': pop,
    };
  }

  factory HourlyWeatherDto.fromMap(Map<String, dynamic> map) {
    return HourlyWeatherDto(
      dt: map['dt'] as int,
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
      windGust: map['wind_gust'] != null ? map['wind_gust'] as num : null,
      statusDto:
          WeatherStatusDto.fromMap(map['weather'][0] as Map<String, dynamic>),
      pop: map['pop'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourlyWeatherDto.fromJson(String source) =>
      HourlyWeatherDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HourlyWeatherDto(dt: $dt, temp: $temp, feelsLike: $feelsLike, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, uvi: $uvi, clouds: $clouds, visibility: $visibility, windSpeed: $windSpeed, windDeg: $windDeg, windGust: $windGust, statusDto: $statusDto, pop: $pop)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HourlyWeatherDto &&
        other.dt == dt &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.dewPoint == dewPoint &&
        other.uvi == uvi &&
        other.clouds == clouds &&
        other.visibility == visibility &&
        other.windSpeed == windSpeed &&
        other.windDeg == windDeg &&
        other.windGust == windGust &&
        other.statusDto == statusDto &&
        other.pop == pop;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        temp.hashCode ^
        feelsLike.hashCode ^
        pressure.hashCode ^
        humidity.hashCode ^
        dewPoint.hashCode ^
        uvi.hashCode ^
        clouds.hashCode ^
        visibility.hashCode ^
        windSpeed.hashCode ^
        windDeg.hashCode ^
        windGust.hashCode ^
        statusDto.hashCode ^
        pop.hashCode;
  }
}

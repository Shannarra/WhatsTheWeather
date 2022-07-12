import 'dart:convert';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/weather_status_dto.dart';

class DailyWeatherDto {
  final int dt;
  final int sunrise;
  final int sunset;
  final int moonrise;
  final int moonset;
  final Temp temp;
  final int pressure;
  final int humidity;
  final num dewPoint;
  final num windSpeed;
  final int windDeg;
  final int clouds;
  final WeatherStatusDto weather;
  final num? pop;
  final num? rain;
  final num? snow;
  final num? uvi;
  DailyWeatherDto({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.clouds,
    required this.weather,
    this.pop,
    this.rain,
    this.snow,
    this.uvi,
  });

  DailyWeatherDto copyWith({
    int? dt,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    Temp? temp,
    int? pressure,
    int? humidity,
    num? dewPoint,
    num? windSpeed,
    int? windDeg,
    int? clouds,
    WeatherStatusDto? weather,
    num? pop,
    num? rain,
    num? snow,
    num? uvi,
  }) {
    return DailyWeatherDto(
      dt: dt ?? this.dt,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      moonrise: moonrise ?? this.moonrise,
      moonset: moonset ?? this.moonset,
      temp: temp ?? this.temp,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      dewPoint: dewPoint ?? this.dewPoint,
      windSpeed: windSpeed ?? this.windSpeed,
      windDeg: windDeg ?? this.windDeg,
      clouds: clouds ?? this.clouds,
      weather: weather ?? this.weather,
      pop: pop ?? this.pop,
      rain: rain ?? this.rain,
      snow: snow ?? this.snow,
      uvi: uvi ?? this.uvi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'temp': temp.toMap(),
      'pressure': pressure,
      'humidity': humidity,
      'dew_point': dewPoint,
      'wind_speed': windSpeed,
      'wind_deg': windDeg,
      'clouds': clouds,
      'weather': weather.toMap(),
      'pop': pop,
      'rain': rain,
      'snow': snow,
      'uvi': uvi,
    };
  }

  factory DailyWeatherDto.fromMap(Map<String, dynamic> map) {
    return DailyWeatherDto(
      dt: map['dt'] as int,
      sunrise: map['sunrise'] as int,
      sunset: map['sunset'] as int,
      moonrise: map['moonrise'] as int,
      moonset: map['moonset'] as int,
      temp: Temp.fromMap(map['temp'] as Map<String,dynamic>),
      pressure: map['pressure'] as int,
      humidity: map['humidity'] as int,
      dewPoint: map['dew_point'] as num,
      windSpeed: map['wind_speed'] as num,
      windDeg: map['wind_deg'] as int,
      clouds: map['clouds'] as int,
      weather: WeatherStatusDto.fromMap(map['weather'][0] as Map<String,dynamic>),
      pop: map['pop'] != null ? map['pop'] as num : null,
      rain: map['rain'] != null ? map['rain'] as num : null,
      snow: map['snow'] != null ? map['snow'] as num : null,
      uvi: map['uvi'] != null ? map['uvi'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyWeatherDto.fromJson(String source) => DailyWeatherDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DailyWeatherDto(dt: $dt, sunrise: $sunrise, sunset: $sunset, moonrise: $moonrise, moonset: $moonset, temp: $temp, pressure: $pressure, humidity: $humidity, dewPoint: $dewPoint, windSpeed: $windSpeed, windDeg: $windDeg, clouds: $clouds, weather: $weather, pop: $pop, rain: $rain, snow: $snow, uvi: $uvi)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DailyWeatherDto &&
      other.dt == dt &&
      other.sunrise == sunrise &&
      other.sunset == sunset &&
      other.moonrise == moonrise &&
      other.moonset == moonset &&
      other.temp == temp &&
      other.pressure == pressure &&
      other.humidity == humidity &&
      other.dewPoint == dewPoint &&
      other.windSpeed == windSpeed &&
      other.windDeg == windDeg &&
      other.clouds == clouds &&
      other.weather == weather &&
      other.pop == pop &&
      other.rain == rain &&
      other.snow == snow &&
      other.uvi == uvi;
  }

  @override
  int get hashCode {
    return dt.hashCode ^
      sunrise.hashCode ^
      sunset.hashCode ^
      moonrise.hashCode ^
      moonset.hashCode ^
      temp.hashCode ^
      pressure.hashCode ^
      humidity.hashCode ^
      dewPoint.hashCode ^
      windSpeed.hashCode ^
      windDeg.hashCode ^
      clouds.hashCode ^
      weather.hashCode ^
      pop.hashCode ^
      rain.hashCode ^
      snow.hashCode ^
      uvi.hashCode;
  }
}

class Temp {
  final num day;
  final num min;
  final num max;
  final num night;
  final num eve;
  final num morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
      'min': min,
      'max': max,
      'night': night,
      'eve': eve,
      'morn': morn,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      day: map['day'] as num,
      min: map['min'] as num,
      max: map['max'] as num,
      night: map['night'] as num,
      eve: map['eve'] as num,
      morn: map['morn'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) =>
      Temp.fromMap(json.decode(source) as Map<String, dynamic>);
}

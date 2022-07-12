import 'package:flutter_course_2022/application/models/weather_alert_model.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/alert.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/dto/weather_alert_dto.dart';

class AlertMapper {
  static const int _secondsToMillisecondsMultiplier = 1000;

  static WeatherAlertModel dtoToModel(WeatherAlertDto dto) => WeatherAlertModel(
      name: dto.event,
      description: dto.description,
      unixStart: dto.start * _secondsToMillisecondsMultiplier,
      unixEnd: dto.end * _secondsToMillisecondsMultiplier,
      isNotified: false,);

  static WeatherAlertModel entityToModel(Alert alert) => WeatherAlertModel(
        name: alert.event,
        description: alert.description,
        unixStart: alert.start * _secondsToMillisecondsMultiplier,
        unixEnd: alert.end * _secondsToMillisecondsMultiplier,
        isNotified: alert.notified,
      );

  static Alert modelToEntity(WeatherAlertModel model) => Alert()
    ..id = model.id
    ..event = model.name
    ..start = model.unixStart
    ..end =  model.unixEnd
    ..description = model.description
    ..notified = model.isNotified;
}

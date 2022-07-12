import 'package:flutter_course_2022/application/models/weather_alert_model.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/daos/alert_dao.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/alert.dart';
import 'package:flutter_course_2022/data/mappers/alert_mapper.dart';

abstract class AlertRepository {
  Stream<WeatherAlertModel?> notNotifiedAlert();

  Future<void> putAlert(WeatherAlertModel model);

  Future<void> insertAllMissing(List<WeatherAlertModel> data);
}

class AlertRepositoryImplementation extends AlertRepository {
  final AlertDao _alertDao;

  AlertRepositoryImplementation(this._alertDao);

  @override
  Stream<WeatherAlertModel?> notNotifiedAlert() => _alertDao
      .notNotified()
      .map((Alert? e) => e == null ? null : AlertMapper.entityToModel(e));

  @override
  Future<void> putAlert(WeatherAlertModel model) =>
      _alertDao.createOrUpdate(AlertMapper.modelToEntity(model));

  @override
  Future<void> insertAllMissing(List<WeatherAlertModel> data) async {
    for (WeatherAlertModel alert in data) {
      final Alert entity = AlertMapper.modelToEntity(alert);
      final Alert? existing = await _alertDao.findExisting(entity);

      if (existing == null) {
        await _alertDao.createOrUpdate(entity);
      }
    }
  }
}

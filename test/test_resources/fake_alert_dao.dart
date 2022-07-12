import 'package:flutter_course_2022/data/data_sources/local/database/daos/alert_dao.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/alert.dart';
import 'package:flutter_course_2022/utils/extensions/list_extensions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

class FakeAlertDao extends Fake implements AlertDao {
  final List<Alert> _alerts = List<Alert>.empty(growable: true);

  final BehaviorSubject<List<Alert>> _alertSubject =
      BehaviorSubject<List<Alert>>();

  FakeAlertDao() {
    _alertSubject.add(_alerts);
  }

  @override
  Future<Alert?> findExisting(Alert alert) async => _alerts.firstWhereOrNull(
        (Alert e) =>
            e.start == alert.start &&
            e.end == alert.end &&
            e.event == alert.event,
      );

  @override
  Stream<Alert?> notNotified() => _alertSubject.stream.map(
        (List<Alert> e) => e.firstWhereOrNull((Alert e) => e.notified == false),
      );

  @override
  Future<void> createOrUpdate(Alert alert) async {
    final int index = _alerts.indexWhere(
      (Alert e) =>
          e.start == alert.start &&
          e.end == alert.end &&
          e.event == alert.event,
    );

    if (index > -1) {
      _alerts[index] = alert;
    } else {
      _alerts.add(alert);
    }

    _alertSubject.add(_alerts);
  }
}

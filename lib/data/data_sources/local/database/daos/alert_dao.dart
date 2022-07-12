import 'package:flutter_course_2022/data/data_sources/local/database/entities/alert.dart';
import 'package:isar/isar.dart';

class AlertDao {
  final Isar _db;

  AlertDao(this._db);

  Future<Alert?> findExisting(Alert alert) => _db.alerts
      .where()
      .endEventStartEqualTo(alert.end, alert.event, alert.start)
      .findFirst();

  Stream<Alert?> notNotified() => _db.alerts
      .filter()
      .notifiedEqualTo(true)
      .limit(1)
      .watch(initialReturn: true)
      .map((List<Alert> e) => e.isEmpty ? null : e.first);

  Future<void> createOrUpdate(Alert alert) => _db.writeTxn(
        (Isar isar) async {
          alert.id ??= (await isar.alerts
                  .where()
                  .endEventStartEqualTo(alert.end, alert.event, alert.start)
                  .findFirst())
              ?.id;

          isar.alerts.put(alert);
        },
      );
}

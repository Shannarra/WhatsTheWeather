import 'package:isar/isar.dart';

part 'alert.g.dart';

@Collection()
class Alert {
  int? id;

  late String event;

  late int start;

  @Index(
    composite: <CompositeIndex>[
      CompositeIndex('event', caseSensitive: false),
      CompositeIndex('start')
    ],
  )
  late int end;

  late String description;

  late bool notified;
}

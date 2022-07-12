import 'package:clock/clock.dart';
import 'package:flutter_course_2022/application/services/time_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Time service tests', () {
    test('Show current time', () {
      final Clock clock = Clock.fixed(DateTime.now());
      final TimeService timeService = TimeServiceImplementation(clock);

      expect(timeService.currentTimeStream, emits(clock.now()));
    });

    test('Show its 1960', () {

    });
  });
}

import 'package:clock/clock.dart';
import 'package:rxdart/rxdart.dart';

abstract class TimeService {
  Stream<DateTime> get currentTimeStream;
}

class TimeServiceImplementation extends TimeService {
  late Stream<DateTime> _deviceTime;

  final Clock clock;

  TimeServiceImplementation(this.clock) {
    _deviceTime = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (_) => clock.now(),
    ).startWith(clock.now()).shareReplay(maxSize: 1);
  }

  @override
  Stream<DateTime> get currentTimeStream => _deviceTime;
}

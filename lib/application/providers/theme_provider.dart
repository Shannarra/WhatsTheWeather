import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_course_2022/application/services/time_service.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/presentation/styles/themes.dart';
import 'package:flutter_course_2022/presentation/view_models/theme_view_model.dart';
import 'package:flutter_course_2022/utils/extensions/int_extensions.dart';
import 'package:rxdart/rxdart.dart';

abstract class ThemeProvider with ChangeNotifier {
  ThemeViewModel get theme;
}

class ThemeProviderImplementation extends ThemeProvider {
  final TimeService _timeService;

  late ValueStream<ThemeViewModel> _themeStream;
  late StreamSubscription<ThemeViewModel> _subscription;

  ThemeProviderImplementation(this._timeService) {
    _themeStream = _timeService.currentTimeStream
        .map((DateTime e) => e.hour)
        .distinct()
        .map(_mapTimeToViewModel)
        .shareValueSeeded(
          ThemeViewModel(
            backgroundImage: Assets.images.bg,
            themeData: Themes.lightTheme,
          ),
        );

    _subscription =
        _themeStream.listen((ThemeViewModel event) => notifyListeners());
  }

  ThemeViewModel _mapTimeToViewModel(int hour) {
    if (hour.inRangeInclusive(lower: 0, upper: 3)) {
      return ThemeViewModel(
        backgroundImage: Assets.images.bg4,
        themeData: Themes.darkTheme,
      );
    }

    if (hour.inRangeInclusive(lower: 4, upper: 7)) {
      return ThemeViewModel(
        backgroundImage: Assets.images.bg5,
        themeData: Themes.darkTheme,
      );
    }

    if (hour.inRangeInclusive(lower: 8, upper: 11)) {
      return ThemeViewModel(
        backgroundImage: Assets.images.bg6,
        themeData: Themes.lightTheme,
      );
    }

    if (hour.inRangeInclusive(lower: 12, upper: 15)) {
      return ThemeViewModel(
        backgroundImage: Assets.images.bg,
        themeData: Themes.lightTheme,
      );
    }

    if (hour.inRangeInclusive(lower: 16, upper: 19)) {
      return ThemeViewModel(
        backgroundImage: Assets.images.bg2,
        themeData: Themes.lightTheme,
      );
    }

    if (hour.inRangeInclusive(lower: 20, upper: 23)) {
      return ThemeViewModel(
        backgroundImage: Assets.images.bg3,
        themeData: Themes.darkTheme,
      );
    }

    throw Exception('Cant map hour to model');
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  ThemeViewModel get theme => _themeStream.value;
}

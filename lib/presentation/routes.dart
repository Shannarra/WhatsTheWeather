import 'package:flutter/material.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_course_2022/presentation/pages/city_select_page.dart';
import 'package:flutter_course_2022/presentation/pages/home_page.dart';
import 'package:flutter_course_2022/presentation/pages/next_days_forecast_page.dart';
import 'package:flutter_course_2022/presentation/pages/splash_page.dart';
import 'package:flutter_course_2022/presentation/pages/weather_detail_page.dart';

class Routes {
  static const String entry = 'entry';
  static const String splash = 'splash';
  static const String citySelect = 'city_select';
  static const String home = 'home';
  static const String weatherDetails = "weather_details";
  static const String nextDaysForecast = "next_days_forecast";

  static Route<dynamic>? factory(RouteSettings settings) {
    switch (settings.name) {
      case entry:
        return MaterialPageRoute<Object>(
          builder: (BuildContext context) {
            return FutureBuilder<CityModel?>(
              future: DI.resolve<CityRepository>().selectedCity().first,
              builder: (_, AsyncSnapshot<CityModel?> data) =>
              data.hasData ? const HomePage() : const SplashPage(),
            );
          },
          settings: settings,
        );
      case splash:
        return MaterialPageRoute<Object>(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case citySelect:
        return MaterialPageRoute<Object>(
          builder: (_) => const CitySelectPage(),
          settings: settings,
        );
      case home:
        return MaterialPageRoute<Object>(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case weatherDetails:
        return MaterialPageRoute<Object>(
          builder: (BuildContext context) => WeatherDetailPage(
            args: settings.arguments as WeatherDetailPageArgs,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case nextDaysForecast:
        return MaterialPageRoute<Object>(
          builder: (BuildContext context) => NextDaysForecastPage(
            args: settings.arguments as NextDaysForecastPageArgs,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
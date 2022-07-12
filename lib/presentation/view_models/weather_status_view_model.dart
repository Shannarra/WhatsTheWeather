import 'package:flutter_course_2022/application/models/constants/weather_status.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';

class WeatherStatusViewModel {
  final WeatherStatus status;

  const WeatherStatusViewModel({
    required this.status,
  });

  String? get lottieAsset {
    switch (status) {
      case WeatherStatus.unknown:
        return null;
      case WeatherStatus.clouds:
        return Assets.lottie.cloudy;
      case WeatherStatus.dust:
        return Assets.lottie.dust;
      case WeatherStatus.overcast:
        return Assets.lottie.overcast;
      case WeatherStatus.rain:
        return Assets.lottie.rain;
      case WeatherStatus.drizzle:
        return Assets.lottie.rain;
      case WeatherStatus.sleet:
        return Assets.lottie.sleet;
      case WeatherStatus.snow:
        return Assets.lottie.snow;
      case WeatherStatus.clear:
        return Assets.lottie.sunny;
      case WeatherStatus.thunderstorm:
        return Assets.lottie.thunderstorm;
    }
  }

  String? get imageAsset {
    switch (status) {
      case WeatherStatus.unknown:
        return null;
      case WeatherStatus.clouds:
        return Assets.icons.cloudy.path;
      case WeatherStatus.dust:
        return Assets.icons.dust.path;
      case WeatherStatus.overcast:
        return Assets.icons.overcast.path;
      case WeatherStatus.rain:
        return Assets.icons.rain.path;
      case WeatherStatus.drizzle:
        return Assets.icons.rain.path;
      case WeatherStatus.sleet:
        return Assets.icons.sleet.path;
      case WeatherStatus.snow:
        return Assets.icons.snow.path;
      case WeatherStatus.clear:
        return Assets.icons.sunny.path;
      case WeatherStatus.thunderstorm:
        return Assets.icons.thunderstorm.path;
    }
  }

  String get name {
    switch (status) {
      case WeatherStatus.unknown:
        return t.weather.status_name.unknown;
      case WeatherStatus.clouds:
        return t.weather.status_name.clouds;
      case WeatherStatus.dust:
        return t.weather.status_name.dust;
      case WeatherStatus.overcast:
        return t.weather.status_name.overcast;
      case WeatherStatus.rain:
        return t.weather.status_name.rain;
      case WeatherStatus.drizzle:
        return t.weather.status_name.drizzle;
      case WeatherStatus.sleet:
        return t.weather.status_name.sleet;
      case WeatherStatus.snow:
        return t.weather.status_name.snow;
      case WeatherStatus.clear:
        return t.weather.status_name.clear;
      case WeatherStatus.thunderstorm:
        return t.weather.status_name.thunderstorm;
    }
  }

   String get description {
    switch (status) {
      case WeatherStatus.unknown:
        return t.weather.status_description.unknown;
      case WeatherStatus.clouds:
        return t.weather.status_description.clouds;
      case WeatherStatus.dust:
        return t.weather.status_description.dust;
      case WeatherStatus.overcast:
        return t.weather.status_description.overcast;
      case WeatherStatus.rain:
        return t.weather.status_description.rain;
      case WeatherStatus.drizzle:
        return t.weather.status_description.drizzle;
      case WeatherStatus.sleet:
        return t.weather.status_description.sleet;
      case WeatherStatus.snow:
        return t.weather.status_description.snow;
      case WeatherStatus.clear:
        return t.weather.status_description.clear;
      case WeatherStatus.thunderstorm:
        return t.weather.status_description.thunderstorm;
    }
  }

}

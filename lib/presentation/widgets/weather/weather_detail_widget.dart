import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/view_models/daily_forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/common/additional_info_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/common/info_with_icon.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/extremum_temperature.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/maximum_daily_temperature.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/small_weather_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/weather_widget.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class WeatherDetailWidget extends StatelessWidget {
  final String cityName;
  final DailyForecastViewModel model;

  const WeatherDetailWidget({
    Key? key,
    required this.cityName,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            Text(
              model.dateTitle(LocaleSettings.currentLocale.flutterLocale),
              style: context.theme.primaryTextTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              cityName,
              style: context.theme.primaryTextTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            WeatherWidget(
              temperature: model.currentTemperature,
              description: model.statusViewModel.description,
              imageAsset: model.statusViewModel.imageAsset,
              shadow: false,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ExtremumTemperatureWidget(
                  type: ExtremumType.max,
                  temperature: model.maxTemperature,
                ),
                const SizedBox(width: 12),
                ExtremumTemperatureWidget(
                  type: ExtremumType.min,
                  temperature: model.minTemperature,
                ),
              ],
            ),
            const SizedBox(height: 16),
            MaximumDailyTemperature(
              temperature: model.maxTemperature,
              timeText: model.formattedMaxTemperatureTime(
                LocaleSettings.currentLocale.flutterLocale,
              ),
              unixTime: model.unixMaxTemperature,
            ),
            const SizedBox(height: 21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InfoWithIcon(
                  iconPath: Assets.icons.sunrise.path,
                  name: t.weather.sunrise,
                  description: model.formattedSunrise(
                    LocaleSettings.currentLocale.flutterLocale,
                  ),
                ),
                if (model.firstRainyHour != null)
                  InfoWithIcon(
                    iconPath: model.firstRainyHour!.statusViewModel.imageAsset,
                    name: model.firstRainyHour!.statusViewModel.name,
                    description: model.firstRainyHour!.formattedTime(
                      LocaleSettings.currentLocale.flutterLocale,
                    ),
                  ),
                InfoWithIcon(
                  iconPath: Assets.icons.sunset.path,
                  name: t.weather.sunset,
                  description: model.formattedSunset(
                    LocaleSettings.currentLocale.flutterLocale,
                  ),
                ),
              ],
            ),
            if (model.hourly.isNotEmpty) ...<Widget>[
              const SizedBox(height: 21),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.hourly.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, int index) => SmallWeatherWidget(
                    description:
                        model.hourly[index].statusViewModel.description,
                    imageAsset: model.hourly[index].statusViewModel.imageAsset,
                    temperature: model.hourly[index].temperature,
                    time: model.hourly[index].formattedTime(
                      LocaleSettings.currentLocale.flutterLocale,
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            Text(
              t.weather.details,
              style: context.theme.primaryTextTheme.labelLarge,
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) => AdditionalInfoWidget(
                text: model.details[index].key,
                value: model.details[index].value,
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemCount: model.details.length,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

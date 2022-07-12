import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/pages/next_days_forecast_page.dart';
import 'package:flutter_course_2022/presentation/pages/weather_detail_page.dart';
import 'package:flutter_course_2022/presentation/routes.dart';
import 'package:flutter_course_2022/presentation/view_models/forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/common/info_with_icon.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class SheetDetailHeader extends StatelessWidget {
  final ForecastViewModel model;
  final bool opened;

  const SheetDetailHeader({Key? key, required this.opened, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(48),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).colorScheme.onPrimary,
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: <Widget>[
                if (!opened)
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InfoWithIcon(
                        iconPath: Assets.icons.sunrise.path,
                        name: t.weather.sunrise,
                        description: model.today.formattedSunrise(
                          LocaleSettings.currentLocale.flutterLocale,
                        ),
                      ),
                      if (model.today.firstRainyHour != null)
                        InfoWithIcon(
                          iconPath: model
                              .today.firstRainyHour!.statusViewModel.imageAsset,
                          name:
                              model.today.firstRainyHour!.statusViewModel.name,
                          description:
                              model.today.firstRainyHour!.formattedTime(
                            LocaleSettings.currentLocale.flutterLocale,
                          ),
                        ),
                      InfoWithIcon(
                        iconPath: Assets.icons.sunset.path,
                        name: t.weather.sunset,
                        description: model.today.formattedSunset(
                          LocaleSettings.currentLocale.flutterLocale,
                        ),
                      ),
                    ],
                  ),
                if (!opened) const Divider(),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextButton(
                          onPressed: () => context.navigator.pushNamed(
                            Routes.weatherDetails,
                            arguments: WeatherDetailPageArgs(
                              location: model.location.localizedName(
                                LocaleSettings.currentLocale.flutterLocale,
                              ),
                              data: model.otherDays[0],
                            ),
                          ),
                          child: Text(t.home.tomorrow),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: TextButton(
                          onPressed: () => context.navigator.pushNamed(
                            Routes.nextDaysForecast,
                            arguments: NextDaysForecastPageArgs(
                              location: model.location.localizedName(
                                LocaleSettings.currentLocale.flutterLocale,
                              ),
                              data: model.otherDays,
                            ),
                          ),
                          child: Text(
                            t.home.next_days(count: model.forecastDayCount),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 18,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(
                Radius.circular(32),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  blurRadius: 2,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Icon(
              opened ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: Theme.of(context).primaryIconTheme.color,
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}

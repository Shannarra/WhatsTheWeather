import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/view_models/daily_forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/daily_weather_tile.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class NextDaysForecastPageArgs {
  final String location;
  final List<DailyForecastViewModel> data;

  const NextDaysForecastPageArgs({
    required this.location,
    required this.data,
  });
}

class NextDaysForecastPage extends StatelessWidget {
  final NextDaysForecastPageArgs args;

  const NextDaysForecastPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.next_days(count: args.data.length)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 16),
          Text(
            args.location,
            textAlign: TextAlign.center,
            style: context.theme.primaryTextTheme.headlineSmall,
          ),
          const Divider(height: 32),
          Expanded(
            child: SizedBox(
              height: 140,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: args.data.length,
                separatorBuilder: (_, __) =>  const Divider(),
                itemBuilder: (_, int index) => DailyWeatherTile(
                  iconAsset: args.data[index].statusViewModel.imageAsset,
                  temperature: args.data[index].currentTemperature,
                  description: args.data[index].statusViewModel.description,
                  date: args.data[index].formattedDateAndYear(
                    LocaleSettings.currentLocale.flutterLocale,
                  ),
                  maxTemperature: args.data[index].maxTemperature,
                  minTemperature: args.data[index].minTemperature,
                  wind: args.data[index].windSpeed.toString(),
                  pop: args.data[index].pop.toString(),
                  clouds: args.data[index].clouds.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

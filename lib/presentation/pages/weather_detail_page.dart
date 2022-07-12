import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/view_models/daily_forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/weather_detail_widget.dart';

class WeatherDetailPageArgs {
  final String location;
  final DailyForecastViewModel data;

  const WeatherDetailPageArgs({
    required this.location,
    required this.data,
  });
}

class WeatherDetailPage extends StatelessWidget {
  final WeatherDetailPageArgs args;

  const WeatherDetailPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.data
              .formattedDateAndYear(LocaleSettings.currentLocale.flutterLocale),
        ),
        centerTitle: true,
      ),
      body: WeatherDetailWidget(
        cityName: args.location,
        model: args.data,
      ),
    );
  }
}

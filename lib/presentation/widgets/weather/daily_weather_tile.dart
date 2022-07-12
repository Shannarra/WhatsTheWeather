import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/extremum_temperature.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/small_weather_widget.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class DailyWeatherTile extends StatelessWidget {
  final String? iconAsset;
  final String? temperature;
  final String description;
  final String date;
  final String maxTemperature;
  final String minTemperature;
  final String wind;
  final String? pop;
  final String clouds;

  const DailyWeatherTile({
    Key? key,
    this.iconAsset,
    this.temperature,
    required this.description,
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.wind,
    this.pop,
    required this.clouds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              if (iconAsset != null)
                Image.asset(
                  iconAsset!,
                  color: context.theme.primaryIconTheme.color,
                  width: 32,
                  height: 32,
                ),
              const SizedBox(height: 2),
              Text(
                description,
                style: context.theme.primaryTextTheme.labelMedium,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 170,
            child: Column(
              
              children: <Widget>[
                Text(
                  date,
                  style: context.theme.primaryTextTheme.headlineSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Wind'),
                    Text(wind),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[const Text('Clouds'), Text(clouds)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[const Text('Pop'), Text(pop!)],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ExtremumTemperatureWidget(
                type: ExtremumType.max,
                temperature: maxTemperature,
              ),
              const SizedBox(height: 4),
              ExtremumTemperatureWidget(
                type: ExtremumType.min,
                temperature: minTemperature,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

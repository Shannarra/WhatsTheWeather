import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:flutter_course_2022/presentation/view_models/daily_forecast_view_model.dart';

class ForecastViewModel {
  final CityViewModel location;
  final DailyForecastViewModel today;
  final List<DailyForecastViewModel> otherDays;

  const ForecastViewModel({
    required this.location,
    required this.today,
    required this.otherDays,
  });

  DailyForecastViewModel? get tomorrow =>
      otherDays.isEmpty ? null : otherDays.first;

  int get forecastDayCount => otherDays.length;
}

import 'package:intl/intl.dart';

class TimeUtils {
  static const int secondsInDay = 86400;
  static const int secondsInHour = 3600;
  static const int secondsInMinute = 60;

  static int differenceInDays(DateTime lhs, DateTime rhs) {
    return DateTime(rhs.year, rhs.month, rhs.day)
        .difference(DateTime(lhs.year, lhs.month, lhs.day))
        .inDays
        .abs();
  }

  static DateTime startOfDay(int unix) {
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(unix);

    return DateTime(time.year, time.month, time.day);
  }

  static DateTime endOfDay(int unix) {
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(unix);

    return DateTime(time.year, time.month, time.day, 23, 59, 59);
  }

  static String formatJmUnix(int unix, String? locale) =>
      formatJm(DateTime.fromMillisecondsSinceEpoch(unix), locale);

  static String formatJm(DateTime time, String? locale) =>
      DateFormat.jm(locale).format(time);

  static String formatYMMMMdUnix(int unix, String? locale) =>
      formatYMMMMd(DateTime.fromMillisecondsSinceEpoch(unix), locale);

  static String formatYMMMMd(DateTime time, String? locale) =>
      DateFormat.yMMMMd(locale).format(time);

  static String formatMdUnix(int unix, String? locale) =>
      formatMd(DateTime.fromMillisecondsSinceEpoch(unix), locale);

  static String formatMd(DateTime time, String? locale) =>
      DateFormat.Md(locale).format(time);

  static double percentageElapsedFromDay(int unix) {
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(unix);
    final int hs = time.hour * secondsInHour;
    final int ms = time.minute * secondsInMinute;
    final int ss = time.second;

    return (hs + ms + ss) / secondsInDay.toDouble();
  }
}

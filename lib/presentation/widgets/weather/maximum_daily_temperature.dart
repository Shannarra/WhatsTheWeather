import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/presentation/widgets/common/arc_progress_bar.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:flutter_course_2022/utils/time_utils.dart';

class MaximumDailyTemperature extends StatelessWidget {
  final String temperature;
  final String? timeText;
  final int? unixTime;

  const MaximumDailyTemperature({
    Key? key,
    required this.temperature,
    required this.unixTime,
    required this.timeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.center,
        children: <Widget>[
          ArcProgressBar(
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            progress: unixTime == null
                ? 0
                : TimeUtils.percentageElapsedFromDay(unixTime!),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                Assets.icons.temperature.path,
                color: context.theme.primaryIconTheme.color,
                height: 35,
              ),
              Text(
                temperature,
                style: context.theme.primaryTextTheme.headlineMedium,
              )
            ],
          ),
          if (timeText != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                timeText!,
                style: context.theme.textTheme.bodyLarge,
              ),
            )
        ],
      ),
    );
  }
}

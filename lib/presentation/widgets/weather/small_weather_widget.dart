import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/widgets/common/info_with_icon.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';

class SmallWeatherWidget extends StatelessWidget {
  final String? lottieAsset;
  final String? imageAsset;
  final String? temperature;
  final String description;
  final String? time;

  const SmallWeatherWidget({
    Key? key,
    this.lottieAsset,
    this.imageAsset,
    this.temperature,
    required this.description,
    this.time,
  })  : assert(lottieAsset != null || imageAsset != null),
        assert(lottieAsset == null || imageAsset == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        children: <Widget> [
          Row(
            children: <Widget>[
              if (lottieAsset != null)
                Lottie.asset(lottieAsset!, width: 32, height: 32),
              if (imageAsset != null)
                Image.asset(
                  imageAsset!,
                  width: 32,
                  height: 32,
                  color: context.theme.primaryIconTheme.color,
                ),
              const SizedBox(height: 2),
              if (temperature != null)
                Text(
                  temperature!,
                  style: context.theme.textTheme.labelLarge,
                ),
            ],
          ),
          Text(
            description,
            style: context.theme.textTheme.labelMedium,
          ),
          if (time != null)
            Text(
              time!,
              style: context.theme.textTheme.labelMedium,
            ),
        ],
      ),
    );
  }
}

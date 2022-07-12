import 'package:flutter/material.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';

class WeatherWidget extends StatelessWidget {
  final String? lottieAsset;
  final String? imageAsset;
  final String? temperature;
  final String description;
  final bool shadow;

  const WeatherWidget({
    Key? key,
    this.lottieAsset,
    this.imageAsset,
    this.temperature,
    required this.description,
    this.shadow = true,
  })  : assert(lottieAsset != null || imageAsset != null),
        assert(lottieAsset == null || imageAsset == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: <BoxShadow>[
          if (shadow)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
            ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (lottieAsset != null)
                Lottie.asset(lottieAsset!, width: 60, height: 60),
              if (imageAsset != null)
                Image.asset(
                  imageAsset!,
                  width: 60,
                  height: 60,
                  color: context.theme.primaryIconTheme.color,
                ),
              const SizedBox(width: 8),
              if (temperature != null)
                Text(
                  temperature!,
                  style: context.theme.primaryTextTheme.headlineLarge,
                ),
            ],
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: context.theme.primaryTextTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

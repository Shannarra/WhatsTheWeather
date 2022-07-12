import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

enum ExtremumType { min, max }

class ExtremumTemperatureWidget extends StatelessWidget {
  final ExtremumType type;
  final String temperature;

  const ExtremumTemperatureWidget({
    Key? key,
    required this.type,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          describeEnum(
            ExtremumType.values
                .firstWhere((ExtremumType element) => element == type),
          ),
        ),
        const SizedBox(width: 5),
 
        Image.asset(
        getIcon(),
        color: context.theme.primaryIconTheme.color,
        width: 16,
        height: 16,
      ),
              const SizedBox(width: 5),

        Text(temperature)
      ],
    );
  }

  String getIcon() {
    if (type == ExtremumType.min) {
      return  
        Assets.icons.arrowDown.path ;
    } else {
      return  
        Assets.icons.arrowUp.path;

    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';

class UnitButton extends StatelessWidget {
  final TemperatureUnit value;
  final ValueChanged<TemperatureUnit> valueChangedCallback;

  const UnitButton({
    Key? key,
    required this.value,
    required this.valueChangedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        valueChangedCallback(
          value == TemperatureUnit.celsius
              ? TemperatureUnit.fahrenheit
              : TemperatureUnit.celsius,
        );
      },
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(90),
          ),
        ),
      ),
      child: AnimatedCrossFade(
        firstChild: const Text('C°'),
        secondChild: const Text('F°'),
        crossFadeState: value == TemperatureUnit.celsius
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}

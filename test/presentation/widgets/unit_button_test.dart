import 'package:flutter/material.dart';
import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/unit_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit Button Test', () {
    testWidgets('Show Celsius and Change to Fahrenheit',
        (WidgetTester tester) async {
      TemperatureUnit unit = TemperatureUnit.celsius;
      TemperatureUnit? received;

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: UnitButton(
            value: unit,
            valueChangedCallback: (TemperatureUnit unit) {
              received = unit;
            },
          ),
        ),
      );

      expect(find.textContaining('C'), findsOneWidget);

      await tester.tap(find.byType(UnitButton), warnIfMissed: true);
      await tester.pumpAndSettle();

      expect(received, TemperatureUnit.fahrenheit);
    });

    testWidgets('Show Fahrenheit and Change to Celsius',
        (WidgetTester tester) async {});
  });
}

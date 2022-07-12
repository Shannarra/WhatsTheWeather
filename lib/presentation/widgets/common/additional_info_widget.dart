import 'package:flutter/material.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class AdditionalInfoWidget extends StatelessWidget {
  final String text;
  final String value;
  final double padding;

  const AdditionalInfoWidget({
    Key? key,
    required this.text,
    required this.value,
    this.padding = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: context.theme.primaryTextTheme.bodyLarge,
            ),
          ),
        ),
        SizedBox(
          width: padding,
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: context.theme.primaryTextTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}

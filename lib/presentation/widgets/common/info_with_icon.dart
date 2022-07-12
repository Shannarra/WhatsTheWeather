import 'package:flutter/material.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';

class InfoWithIcon extends StatelessWidget {
  final String? iconPath;
  final String name;
  final String description;

  const InfoWithIcon({
    Key? key,
    this.iconPath,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (iconPath != null)
          Image.asset(
            iconPath!,
            color: context.theme.primaryIconTheme.color,
            width: 32,
            height: 32,
          ),
        const SizedBox(height: 2),
        Text(
          name,
          style: context.theme.primaryTextTheme.labelMedium,
        ),
        Text(
          description,
          style: context.theme.textTheme.labelLarge,
        ),
      ],
    );
  }
}

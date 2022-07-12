import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  final String? text;
  final Widget? other;

  const NoDataWidget({Key? key, this.text, this.other}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(
            Assets.lottie.noData,
            repeat: false,
            width: 250,
            height: 250,
          ),
          if (text != null)
            Text(
              text!,
              style: context.theme.primaryTextTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          if (other != null) ...<Widget>[
            const SizedBox(height: 16),
            other!,
          ]
        ],
      ),
    );
  }
}

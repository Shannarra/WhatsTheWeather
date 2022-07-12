import 'package:flutter/material.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback? reloadTap;

  const AppErrorWidget({Key? key, this.reloadTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(Assets.lottie.error, width: 250, height: 250),
          Text(
            t.error.title,
            style: context.theme.primaryTextTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          if (reloadTap != null)
            ElevatedButton(
              onPressed: reloadTap,
              child: Text(t.error.button),
            ),
        ],
      ),
    );
  }
}

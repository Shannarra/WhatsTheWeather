import 'package:flutter/cupertino.dart';
import 'package:flutter_course_2022/gen/assets.gen.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(Assets.lottie.loading, width: 250, height: 250),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/presentation/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.initialize();

  runApp(const Application());
}

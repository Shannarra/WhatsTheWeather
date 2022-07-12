import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/location_messages.dart',
    objcHeaderOut: 'ios/Classes/LocationMessages.h',
    objcSourceOut: 'ios/Classes/LocationMessages.m',
    javaOut:
    'android/src/main/java/com/flutter/course/location_plugin/LocationMessages.java',
    javaOptions:
    JavaOptions(package: 'com.flutter.course.location_plugin'),
    dartOptions: DartOptions(isNullSafe: true),
  ),
)
class LocationResult {
  late double latitude;
  late double longitude;
}

@HostApi()
abstract class LocationApi {
  @async
  LocationResult? getCurrentLocation();
}
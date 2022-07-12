import 'dart:async';

import 'package:location_plugin/location_messages.dart';

class LocationPlugin {
  static final _api = LocationApi();

  static Future<LocationResult?> getCurrentLocation() =>
      _api.getCurrentLocation();
}

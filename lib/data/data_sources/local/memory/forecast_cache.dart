import 'package:flutter_course_2022/core/cache/base_cache.dart';
import 'package:flutter_course_2022/data/data_sources/local/memory/cache_data/coordinate_cache_key.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/response/forecast_response.dart';

class ForecastCache extends BaseCache<CoordinatesCacheKey, ForecastResponse> {
  ForecastCache({required Duration expirationTime})
      : super(expirationTime: expirationTime);
}

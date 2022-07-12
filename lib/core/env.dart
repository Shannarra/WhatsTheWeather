class Env {
  static const String apiUrl = 'https://api.openweathermap.org';
  static const String appId = '9de243494c0b295cca9337e1e96b00e2';
  static const int connectTimeout = 15000;
  static const int receiveTimeout = 20000;
  static const Duration cacheExpirationTime = Duration(minutes: 5);
}

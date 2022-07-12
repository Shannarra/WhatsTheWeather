import 'dart:io';

import 'package:clock/clock.dart';
import 'package:flutter_course_2022/application/blocs/saved_city_cubit.dart';
import 'package:flutter_course_2022/application/blocs/search_city_cubit.dart';
import 'package:flutter_course_2022/application/blocs/weather_cubit.dart';
import 'package:flutter_course_2022/application/providers/settings_provider.dart';
import 'package:flutter_course_2022/application/providers/theme_provider.dart';
import 'package:flutter_course_2022/application/services/notification_service.dart';
import 'package:flutter_course_2022/application/services/sync_service.dart';
import 'package:flutter_course_2022/application/services/time_service.dart';
import 'package:flutter_course_2022/core/env.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/daos/alert_dao.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/daos/city_dao.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/alert.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/entities/city.dart';
import 'package:flutter_course_2022/data/data_sources/local/memory/forecast_cache.dart';
import 'package:flutter_course_2022/data/data_sources/local/shared_preferences/settings.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_http_client.dart';
import 'package:flutter_course_2022/data/repositories/alert_repository.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_course_2022/data/repositories/settings_repository.dart';
import 'package:flutter_course_2022/data/repositories/weather_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class DI {
  static T resolve<T extends Object>() => GetIt.I<T>();

  static Future<void> initialize() async {
    await _registerPersistence();
    _registerApis();
    _registerRepositories();
    _registerServices();
    _registerStateManagement();
  }

  static Future<void> _registerPersistence() async {
    //db initialization
    final Directory dir = await getApplicationSupportDirectory();
    final Isar db = await Isar.open(
      schemas: <CollectionSchema<dynamic>>[CitySchema, AlertSchema],
      directory: dir.path,
    );
    GetIt.I.registerSingleton(db);

    //dao initialization
    GetIt.I
      ..registerSingleton(CityDao(db))
      ..registerSingleton(AlertDao(db));

    //preferences initialization
    final RxSharedPreferences preferences = RxSharedPreferences.getInstance();
    GetIt.I.registerSingleton(Settings(preferences));

    //cache initialization
    GetIt.I.registerSingleton(
      ForecastCache(expirationTime: Env.cacheExpirationTime),
    );
  }

  static void _registerApis() async {
    GetIt.I.registerSingleton(
      OpenWeatherApi(
        OpenWeatherHttpClient(
          baseUrl: Env.apiUrl,
          apiKey: Env.appId,
          receiveTimeout: Env.receiveTimeout,
          connectTimeout: Env.connectTimeout,
        ),
      ),
    );
  }

  static void _registerRepositories() {
    GetIt.I
      ..registerSingleton<AlertRepository>(
        AlertRepositoryImplementation(resolve()),
      )
      ..registerSingleton<CityRepository>(
        CityRepositoryImplementation(resolve(), resolve()),
      )
      ..registerSingleton<WeatherRepository>(
        WeatherRepositoryImplementation(resolve(), resolve()),
      )
      ..registerSingleton<SettingsRepository>(
        SettingsRepositoryImplementation(resolve()),
      );
  }

  static void _registerServices() {
    GetIt.I
      ..registerSingleton<TimeService>(TimeServiceImplementation(clock))
      ..registerSingleton<NotificationService>(NotificationService(resolve()))
      ..registerSingleton<SyncService>(
        SyncServiceImplementation(
          resolve(),
          resolve(),
          resolve(),
        ),
      );
  }

  static void _registerStateManagement() {
    GetIt.I
      ..registerFactory<SearchCityCubit>(
        () => SearchCityCubitImplementation(resolve()),
      )
      ..registerFactory<SavedCitiesCubit>(
        () => SavedCitiesCubitImplementation(resolve()),
      )
      ..registerFactory<WeatherCubit>(
        () => WeatherCubitImplementation(
          resolve(),
          resolve(),
        ),
      )
      ..registerFactory<ThemeProvider>(
        () => ThemeProviderImplementation(resolve()),
      )
      ..registerFactory<SettingsProvider>(
        () => SettingsProviderImplementation(resolve()),
      );
  }
}

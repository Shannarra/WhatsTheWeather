import 'dart:developer';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_course_2022/application/models/city_forecast_model.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/repositories/alert_repository.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_course_2022/data/repositories/weather_repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class SyncService {
  Stream<Result<CityForecastModel>?> get weatherStream;

  Stream<Result<CityForecastModel>?> loadWeather();

  void reload();
}

void headlessService(HeadlessTask t) async {
  await DI.initialize();
  final SyncService syncService = DI.resolve<SyncService>();

  await syncService.loadWeather().last;

  BackgroundFetch.finish(t.taskId);
}

class SyncServiceImplementation extends SyncService {
  final WeatherRepository _weatherRepository;
  final CityRepository _cityRepository;
  final AlertRepository _alertRepository;

  final PublishSubject<bool> _reloadTrigger = PublishSubject<bool>();

  late ReplayConnectableStream<Result<CityForecastModel>?> _weatherStream;

  SyncServiceImplementation(
    this._weatherRepository,
    this._cityRepository,
    this._alertRepository,
  ) {
    final ReplayStream<CityModel?> cityStream =
        _cityRepository.selectedCity().shareReplay(maxSize: 1);

    _weatherStream = cityStream
        .switchMap(
          (CityModel? value) => MergeStream<bool>(
            <Stream<bool>>[
              Stream<bool>.value(true),
              _reloadTrigger,
            ],
          ),
        )
        .switchMap((_) => loadWeather())
        .publishReplay(maxSize: 1)
      ..connect();

    _configureBackgroundFetch();
  }

  void _configureBackgroundFetch() async {
    try {
      await BackgroundFetch.configure(
        BackgroundFetchConfig(
          minimumFetchInterval: 15,
          stopOnTerminate: false,
          enableHeadless: true,
          requiresBatteryNotLow: false,
          requiresCharging: false,
          requiresStorageNotLow: false,
          requiresDeviceIdle: false,
          requiredNetworkType: NetworkType.ANY,
          startOnBoot: true,
        ),
        (String taskId) {
          reload();
          BackgroundFetch.finish(taskId);
        },
      );

      BackgroundFetch.registerHeadlessTask(headlessService);

      BackgroundFetch.start();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Stream<Result<CityForecastModel>?> loadWeather() async* {
    final CityModel? city = await _cityRepository.selectedCity().first;

    if (city == null) {
      yield null;
      return;
    }

    yield Result<CityForecastModel>.loading();

    final Result<CityForecastModel> result =
        await _weatherRepository.forecastForCity(city);

    if (result.isSuccess) {
      await _alertRepository.insertAllMissing(
        result.toSuccess().data.alerts,
      );
    }

    yield result.map((CityForecastModel e) => e.copyWith(cityModel: city));
  }

  @override
  void reload() {
    _reloadTrigger.add(true);
  }

  @override
  Stream<Result<CityForecastModel>?> get weatherStream => _weatherStream;
}

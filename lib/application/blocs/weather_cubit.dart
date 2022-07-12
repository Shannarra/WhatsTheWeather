import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_course_2022/application/blocs/states/view_state.dart';
import 'package:flutter_course_2022/application/mappers/city_view_model_mapper.dart';
import 'package:flutter_course_2022/application/mappers/forecast_view_model_mapper.dart';
import 'package:flutter_course_2022/application/models/city_forecast_model.dart';
import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:flutter_course_2022/application/services/sync_service.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/repositories/settings_repository.dart';
import 'package:flutter_course_2022/presentation/view_models/forecast_view_model.dart';
import 'package:rxdart/rxdart.dart';

abstract class WeatherCubit extends Cubit<ViewState<ForecastViewModel>> {
  WeatherCubit() : super(ViewState<ForecastViewModel>.notLoaded());

  void reload();
}

class WeatherCubitImplementation extends WeatherCubit {
  final SettingsRepository _settingsRepository;
  final SyncService _syncService;

  late StreamSubscription<void> _weatherSubscription;

  WeatherCubitImplementation(
    this._settingsRepository,
    this._syncService,
  ) {
    final ReplayConnectableStream<void> syncStream =
        CombineLatestStream.combine2<Result<CityForecastModel>?,
                TemperatureUnit, ViewState<ForecastViewModel>>(
      _syncService.weatherStream,
      _settingsRepository.getUnits(),
      _mapToModel,
    )
            .map(
              (ViewState<ForecastViewModel> e) => emit(e),
            )
            .publishReplay(maxSize: 1);

    _weatherSubscription = syncStream.connect();
  }

  ViewState<ForecastViewModel> _mapToModel(
    Result<CityForecastModel>? result,
    TemperatureUnit unit,
  ) {
    if (result == null) return ViewState<ForecastViewModel>.notLoaded();

    if (result.isLoading) return ViewState<ForecastViewModel>.loading();

    if (result.isFail) {
      return ViewState<ForecastViewModel>.error(
        result.toError().exception,
      );
    }

    if (result.isSuccess) {
      final CityForecastModel data = result.toSuccess().data;

      return ViewStateLoaded<ForecastViewModel>(
        ForecastViewModelMapper.forecastViewModelFromData(
          CityViewModelMapper.modelToViewModel(data.cityModel!),
          data,
          unit,
        ),
      );
    }

    return ViewStateNotLoaded<ForecastViewModel>();
  }

  @override
  void reload() {
    _syncService.reload();
  }

  @override
  Future<void> close() {
    _weatherSubscription.cancel();
    return super.close();
  }
}

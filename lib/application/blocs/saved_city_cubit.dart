import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_2022/application/blocs/states/saved_state.dart';
import 'package:flutter_course_2022/application/mappers/city_view_model_mapper.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:rxdart/rxdart.dart';

abstract class SavedCitiesCubit extends Cubit<SavedState<CityViewModel>> {
  SavedCitiesCubit() : super(SavedState<CityViewModel>.empty());

  Future<void> selectCity(CityViewModel viewModel);

  Future<void> deleteCity(CityViewModel viewModel);
}

class SavedCitiesCubitImplementation extends SavedCitiesCubit {
  final CityRepository _cityRepository;
  late StreamSubscription<List<CityViewModel>> _savedCitySubscription;

  SavedCitiesCubitImplementation(this._cityRepository) {
    _savedCitySubscription = _cityRepository
        .savedCities()
        .map(
          (List<CityModel> e) =>
              e.map(CityViewModelMapper.modelToViewModel).toList(),
        )
        .doOnData(
          (List<CityViewModel> event) => emit(SavedState<CityViewModel>(event)),
        )
        .publishReplay(maxSize: 1)
        .connect();
  }

  @override
  Future<void> deleteCity(CityViewModel viewModel) async {
    //delete the model
    await _cityRepository.deleteCity(
      model: CityViewModelMapper.viewModelToModel(viewModel),
    );

    /*
    If the deleted model is the selected one check for other saved cities
     and mark the first one
     */
    if (viewModel.selected) {
      final List<CityModel> savedCities =
          await _cityRepository.savedCities().first;
      final CityModel? firstCity =
          savedCities.isEmpty ? null : savedCities.first;

      if (firstCity == null) return;

      _cityRepository.putCity(model: firstCity.copyWith(selected: true));
    }
  }

  @override
  Future<void> selectCity(CityViewModel viewModel) async {
    //if the city is already selected don't do anything
    if (viewModel.selected) return;

    final CityModel model = CityViewModelMapper.viewModelToModel(viewModel);

    //only one city must be selected at a time
    await _cityRepository.deselectAllCities();
    await _cityRepository.putCity(model: model.copyWith(selected: true));
  }

  @override
  Future<void> close() {
    _savedCitySubscription.cancel();
    return super.close();
  }
}

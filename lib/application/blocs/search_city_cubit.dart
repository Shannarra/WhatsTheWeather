import 'package:bloc/bloc.dart';
import 'package:flutter_course_2022/application/blocs/states/view_state.dart';
import 'package:flutter_course_2022/application/mappers/city_view_model_mapper.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/networking/result.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:location_plugin/location_messages.dart';
import 'package:location_plugin/location_plugin.dart';


abstract class SearchCityCubit extends Cubit<ViewState<List<CityViewModel>>> {
  SearchCityCubit() : super(ViewState<List<CityViewModel>>.notLoaded());

  void search(String? term);

  void locate();

  void reload();
}

class SearchCityCubitImplementation extends SearchCityCubit {
  final CityRepository _cityRepository;

  String? _lastSearchTerm;

  SearchCityCubitImplementation(this._cityRepository) : super();

  @override
  void locate() async {
    emit(ViewState<List<CityViewModel>>.loading());
    final LocationResult? location = await LocationPlugin.getCurrentLocation();

    if (location == null) {
      return emit(ViewState<List<CityViewModel>>.notLoaded());
    }

    final Result<List<CityModel>> result =
    await _cityRepository.searchByCoordinates(
      latitude: location.latitude,
      longitude: location.longitude,
    );

    if (result.isFail) {
      return emit(
        ViewState<List<CityViewModel>>.error(result.toError().exception),
      );
    }

    emit(
      ViewState<List<CityViewModel>>.loaded(
        result
            .toSuccess()
            .data
            .map(CityViewModelMapper.modelToViewModel)
            .toList(),
      ),
    );
  }

  @override
  void search(String? term) async {
    if (term?.isEmpty ?? true) {
      return emit(ViewState<List<CityViewModel>>.notLoaded());
    }

    _lastSearchTerm = term;

    emit(ViewState<List<CityViewModel>>.loading());
    final Result<List<CityModel>> result =
        await _cityRepository.searchByQuery(query: term!);

    if (result.isFail) {
      return emit(
        ViewState<List<CityViewModel>>.error(result.toError().exception),
      );
    }

    emit(
      ViewState<List<CityViewModel>>.loaded(
        result
            .toSuccess()
            .data
            .map(CityViewModelMapper.modelToViewModel)
            .toList(),
      ),
    );
  }

  @override
  void reload() {
    if (_lastSearchTerm?.isEmpty ?? true) {
      return emit(ViewState<List<CityViewModel>>.notLoaded());
    }

    return search(_lastSearchTerm);
  }
}

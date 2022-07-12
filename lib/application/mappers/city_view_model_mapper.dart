import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';

class CityViewModelMapper {
  static CityViewModel modelToViewModel(CityModel model) => CityViewModel(
        name: model.name,
        country: model.country,
        state: model.state,
        latitude: model.latitude,
        longitude: model.longitude,
        localizations: model.localizations,
        selected: model.selected,
      );

  static CityModel viewModelToModel(CityViewModel model) => CityModel(
        name: model.name,
        country: model.country,
        state: model.state,
        latitude: model.latitude,
        longitude: model.longitude,
        localizations: model.localizations,
        selected: model.selected,
      );
}

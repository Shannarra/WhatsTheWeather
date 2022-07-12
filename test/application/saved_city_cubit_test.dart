import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_course_2022/application/blocs/saved_city_cubit.dart';
import 'package:flutter_course_2022/application/blocs/states/saved_state.dart';
import 'package:flutter_course_2022/data/data_sources/local/database/daos/city_dao.dart';
import 'package:flutter_course_2022/data/data_sources/remote/open_weather/open_weather_api.dart';
import 'package:flutter_course_2022/data/repositories/city_repository.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../test_resources/fake_city_dao.dart';
import 'saved_city_cubit_test.mocks.dart';

@GenerateMocks(<Type>[OpenWeatherApi])
void main() {
  late CityRepository repository;
  late OpenWeatherApi api;
  late CityDao dao;

  late CityViewModel model;

  setUpAll(() {
    api = MockOpenWeatherApi();
    dao = FakeCityDao();
    repository = CityRepositoryImplementation(api, dao);

    model = const CityViewModel(
      name: 'Plovdiv',
      country: 'Bg',
      latitude: 0,
      longitude: 0,
      localizations: <String, String>{},
      selected: false,
    );
  });

  blocTest<SavedCitiesCubit, SavedState<CityViewModel>>(
    'select city test',
    build: () => SavedCitiesCubitImplementation(repository),
    act: (SavedCitiesCubit c) => c.selectCity(model),
    expect: () => <dynamic>[
      isA<SavedState<CityViewModel>>(),
      isA<SavedState<CityViewModel>>(),
      isA<SavedState<CityViewModel>>(),
    ],
  );
}

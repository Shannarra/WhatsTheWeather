// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_2022/application/blocs/saved_city_cubit.dart';
import 'package:flutter_course_2022/application/blocs/states/saved_state.dart';
import 'package:flutter_course_2022/application/models/city_model.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/routes.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/city/saved_city_tile.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:flutter_course_2022/utils/extensions/list_extensions.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SavedCitiesCubit>(
      create: (_) => DI.resolve(),
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                t.name,
                style: context.theme.primaryTextTheme.displayMedium,
              ),
            ),
            const Divider(
              thickness: 0.5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    t.drawer.cities_section_title,
                    style: context.theme.primaryTextTheme.bodyLarge,
                  ),
                  IconButton(
                    onPressed: () =>
                        context.navigator.pushNamed(Routes.citySelect),
                    icon: Icon(
                      Icons.add_circle_outlined,
                      color: context.theme.primaryIconTheme.color,
                    ),
                    tooltip: t.drawer.city_add_button_hint,
                  ),
                ],
              ),
            ),
            BlocBuilder<SavedCitiesCubit, SavedState<CityViewModel>>(
              builder: (BuildContext context, SavedState<CityViewModel> state) {
                return Flexible(
                  child: ListView.builder(
                    key: ValueKey<SavedState<CityViewModel>>(state),
                    itemCount: state.data.length,
                    itemBuilder: (_, int i) => SavedCityRadioTile(
                      onDismiss: () =>
                          context.read<SavedCitiesCubit>().deleteCity(
                                state.data[i],
                              ),
                      onValueChange: (_) {
                        context
                            .read<SavedCitiesCubit>()
                            .selectCity(state.data[i]);
                        context.navigator.pop();
                      },
                      groupId: state.data
                          .indexWhere((CityViewModel e) => e.selected),
                      name: state.data[i].localizedName(
                        LocaleSettings.currentLocale.flutterLocale,
                      ),
                      description: state.data[i].description,
                      uniqueId: i,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

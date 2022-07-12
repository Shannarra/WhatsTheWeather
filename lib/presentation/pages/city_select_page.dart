import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_2022/application/blocs/saved_city_cubit.dart';
import 'package:flutter_course_2022/application/blocs/search_city_cubit.dart';
import 'package:flutter_course_2022/application/blocs/states/view_state.dart';
import 'package:flutter_course_2022/application/providers/theme_provider.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/routes.dart';
import 'package:flutter_course_2022/presentation/view_models/city_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/city/city_tile.dart';
import 'package:flutter_course_2022/presentation/widgets/common/app_error_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/common/loader_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/common/no_data_widget.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CitySelectPage extends StatelessWidget {
  const CitySelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        BlocProvider<SearchCityCubit>(
          create: (_) => DI.resolve(),
        ),
        BlocProvider<SavedCitiesCubit>(
          create: (_) => DI.resolve(),
        ),
      ],
      builder: (BuildContext context, _) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(t.city_search.title),
            elevation: 0,
          ),
          body: Stack(
            children: <Widget>[
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: SvgPicture.asset(
                  context.watch<ThemeProvider>().theme.backgroundImage,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                ),
              ),
              SafeArea(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                textInputAction: TextInputAction.search,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  labelText: t.city_search.input_hint,
                                ),
                                onFieldSubmitted:
                                    context.read<SearchCityCubit>().search,
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              onPressed: context.read<SearchCityCubit>().locate,
                              icon: const Icon(Icons.gps_fixed),
                              color: context.theme.primaryIconTheme.color,
                              tooltip: t.city_search.location_button_hint,
                            )
                          ],
                        ),
                      ),
                    ),
                    BlocBuilder<SearchCityCubit,
                        ViewState<List<CityViewModel>>>(
                      builder: (_, ViewState<List<CityViewModel>> state) {
                        if (state is ViewStateNotLoaded) {
                          return _NotLoadedState();
                        }

                        if (state is ViewStateLoading) {
                          return _LoadingState();
                        }

                        if (state is ViewStateLoaded<List<CityViewModel>>) {
                          return state.data.isEmpty
                              ? _NoDataState()
                              : _DataState(data: state.data);
                        }

                        if (state is ViewStateError) {
                          return _ErrorState();
                        }

                        throw Exception('State not mapped');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NotLoadedState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox.shrink(),
    );
  }
}

class _LoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: LoaderWidget(),
      hasScrollBody: false,
    );
  }
}

class _NoDataState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: NoDataWidget(
        text: t.city_search.no_data,
      ),
      hasScrollBody: false,
    );
  }
}

class _DataState extends StatelessWidget {
  final List<CityViewModel> data;

  const _DataState({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int i) => CityTile(
            name: data[i]
                .localizedName(LocaleSettings.currentLocale.flutterLocale),
            description: data[i].description,
            onTap: () {
              context.read<SavedCitiesCubit>().selectCity(data[i]);
              context.navigator.pop(data[i]);
            },
          ),
          childCount: data.length,
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: AppErrorWidget(
        reloadTap: context.read<SearchCityCubit>().reload,
      ),
      hasScrollBody: false,
    );
  }
}

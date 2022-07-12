import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_2022/application/blocs/states/view_state.dart';
import 'package:flutter_course_2022/application/blocs/weather_cubit.dart';
import 'package:flutter_course_2022/application/models/constants/temperature_unit.dart';
import 'package:flutter_course_2022/application/providers/settings_provider.dart';
import 'package:flutter_course_2022/application/providers/theme_provider.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/routes.dart';
import 'package:flutter_course_2022/presentation/view_models/forecast_view_model.dart';
import 'package:flutter_course_2022/presentation/widgets/common/app_error_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/common/expandable_sheet.dart';
import 'package:flutter_course_2022/presentation/widgets/common/loader_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/common/no_data_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/home/home_drawer.dart';
import 'package:flutter_course_2022/presentation/widgets/home/sheet_detail_header.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/extremum_temperature.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/unit_button.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/weather_detail_widget.dart';
import 'package:flutter_course_2022/presentation/widgets/weather/weather_widget.dart';
import 'package:flutter_course_2022/utils/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => DI.resolve(),
        ),
        BlocProvider<WeatherCubit>(
          create: (_) => DI.resolve(),
        )
      ],
      builder: (BuildContext context, _) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            UnitButton(
              value: context.select<SettingsProvider, TemperatureUnit>(
                    (SettingsProvider p) => p.unit,
              ),
              valueChangedCallback: (TemperatureUnit v) =>
              context.read<SettingsProvider>().unit = v,
            )
          ],
        ),
        drawer: const HomeDrawer(),
        body: Stack(
          children: <Widget>[
            SvgPicture.asset(
              context.watch<ThemeProvider>().theme.backgroundImage,
              fit: BoxFit.cover,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
            SafeArea(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: BlocBuilder<WeatherCubit, ViewState<ForecastViewModel>>(
                  builder: (
                      BuildContext context,
                      ViewState<ForecastViewModel> state,
                      ) {
                    if (state is ViewStateNotLoaded) {
                      return _NotLoadedState();
                    }

                    if (state is ViewStateLoading) {
                      return _LoadingState();
                    }

                    if (state is ViewStateLoaded<ForecastViewModel>) {
                      return _DataState(model: state.data);
                    }

                    if (state is ViewStateError) {
                      return _ErrorState();
                    }

                    throw Exception('State not mapped');
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<WeatherCubit, ViewState<ForecastViewModel>>(
                builder: (
                    BuildContext context,
                    ViewState<ForecastViewModel> state,
                    ) {
                  final bool hasData =
                  state is ViewStateLoaded<ForecastViewModel>;
                  final double opacity = hasData ? 1.0 : 0.0;

                  return AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 500),
                    child: hasData
                        ? ExpandableSheet(
                      header: (bool open) => SheetDetailHeader(
                        model: state.data,
                        opened: open,
                      ),
                      body: WeatherDetailWidget(
                        cityName: state.data.location.localizedName(
                          LocaleSettings.currentLocale.flutterLocale,
                        ),
                        model: state.data.today,
                      ),
                    )
                        : const SizedBox.shrink(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotLoadedState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: NoDataWidget(
        text: t.home.no_data,
        other: ElevatedButton(
          onPressed: () => context.navigator.pushNamed(Routes.citySelect),
          child: Text(t.home.no_data_button),
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LoaderWidget(),
    );
  }
}

class _DataState extends StatelessWidget {
  final ForecastViewModel model;

  const _DataState({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          model.today.dateTitle(LocaleSettings.currentLocale.flutterLocale),
          style: context.theme.primaryTextTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          model.location
              .localizedName(LocaleSettings.currentLocale.flutterLocale),
          style: context.theme.primaryTextTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ExtremumTemperatureWidget(
                  type: ExtremumType.max,
                  temperature: model.today.maxTemperature,
                ),
                const SizedBox(height: 4),
                ExtremumTemperatureWidget(
                  type: ExtremumType.min,
                  temperature: model.today.minTemperature,
                ),
              ],
            ),
            const Spacer(),
            WeatherWidget(
              temperature: model.today.currentTemperature,
              description:  model.today.statusViewModel.description,
              lottieAsset: model.today.statusViewModel.lottieAsset,
            ),
          ],
        )
      ],
    );
  }
}

class _ErrorState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppErrorWidget(
        reloadTap: context.read<WeatherCubit>().reload,
      ),
    );
  }
}

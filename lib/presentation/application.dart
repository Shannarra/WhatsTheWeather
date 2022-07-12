import 'package:flutter/material.dart';
import 'package:flutter_course_2022/application/providers/theme_provider.dart';
import 'package:flutter_course_2022/core/di.dart';
import 'package:flutter_course_2022/gen/strings.g.dart';
import 'package:flutter_course_2022/presentation/pages/splash_page.dart';
import 'package:flutter_course_2022/presentation/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TranslationProvider(
      child: Builder(
        builder: (BuildContext context) {
          return MultiProvider(
            providers: <SingleChildWidget>[
              ChangeNotifierProvider<ThemeProvider>(
                create: (_) => DI.resolve(),
              ),
            ],
            builder: (BuildContext context, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: t.name,
              locale: TranslationProvider.of(context).flutterLocale,
              supportedLocales: LocaleSettings.supportedLocales,
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              theme: context.select<ThemeProvider, ThemeData>(
                (ThemeProvider p) => p.theme.themeData,
              ),
              onGenerateRoute: Routes.factory,
              initialRoute: Routes.entry,
            ),
          );
        },
      ),
    );
  }
}

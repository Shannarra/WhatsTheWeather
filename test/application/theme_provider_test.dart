
import 'package:flutter/cupertino.dart';
import 'package:flutter_course_2022/application/providers/theme_provider.dart';
import 'package:flutter_course_2022/application/services/time_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_provider_test.mocks.dart';

@GenerateMocks(<Type>[TimeService])
void main() {
  late TimeService timeService;
  WidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    GoogleFonts.config.allowRuntimeFetching = false;
    timeService = MockTimeService();
  });


  group('Theme provider tests', () {
    test('Show light theme', () async {
      when(timeService.currentTimeStream)
          .thenAnswer((_) => Stream<DateTime>.value(DateTime(1960, 1, 1, 12)));

      final ThemeProvider provider = ThemeProviderImplementation(timeService);

      await Future<void>.delayed(const Duration(milliseconds: 500), () => null);

      expect(provider.theme.themeData.brightness, Brightness.light);
    });
    
    test('Show dark theme', () async {

    });
  });
}

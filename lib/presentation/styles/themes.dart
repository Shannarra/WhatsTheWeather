import 'package:flutter/material.dart';
import 'package:flutter_course_2022/presentation/styles/app_colors.dart';
import 'package:flutter_course_2022/presentation/styles/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final TextTheme _textTheme = GoogleFonts.montserratTextTheme(
    const TextTheme(
      displayLarge: TextStyle(fontSize: 68, fontWeight: FontWeight.w700),
      displayMedium: TextStyle(fontSize: 56, fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(fontSize: 59, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
    ),
  );

  static final OutlineInputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
  );

  static final ThemeData _baseTheme = ThemeData(
    textTheme: _textTheme,
    primaryTextTheme: _textTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        shape: const StadiumBorder(),
        textStyle: TextStyles.elevatedButton,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyles.textButton,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: _inputBorder,
      focusedBorder: _inputBorder,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );

  static final ThemeData lightTheme = _baseTheme.copyWith(
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      primary: AppColors.lightGray,
      onPrimary: AppColors.lightElementPrimary,
      secondary: AppColors.yellow,
      onSecondary: AppColors.lightElementAccent,
      onBackground: AppColors.lightElementPrimary,
      onSurface: AppColors.lightElementPrimary,
      onError: AppColors.lightElementPrimary,
      brightness: Brightness.light,
      surface: AppColors.yellow,
      background: AppColors.lightGray,
      error: Colors.red,
      tertiary: AppColors.yellow,
      secondaryContainer: AppColors.darkElementPrimary,
     ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _baseTheme.elevatedButtonTheme.style?.merge(
        ElevatedButton.styleFrom(
          primary: AppColors.yellow,
          onPrimary: AppColors.lightElementPrimary,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: _baseTheme.textButtonTheme.style?.merge(
        TextButton.styleFrom(
          primary: AppColors.lightElementPrimary,
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(color: AppColors.lightElementPrimary),
    iconTheme: const IconThemeData(color: AppColors.lightElementAccent),
    primaryTextTheme: _baseTheme.textTheme.apply(
      bodyColor: AppColors.lightElementPrimary,
      displayColor: AppColors.lightElementPrimary,
    ),
    textTheme: _baseTheme.textTheme.apply(
      bodyColor: AppColors.lightElementAccent,
      displayColor: AppColors.lightElementAccent,
    ),
    inputDecorationTheme: _baseTheme.inputDecorationTheme.copyWith(
      iconColor: AppColors.lightElementAccent,
      labelStyle: const TextStyle(color: AppColors.lightElementPrimary),
      border: _baseTheme.inputDecorationTheme.border?.copyWith(
        borderSide: const BorderSide(
          color: AppColors.lightElementPrimary,
        ),
      ),
      focusedBorder: _baseTheme.inputDecorationTheme.border?.copyWith(
        borderSide: const BorderSide(
          color: AppColors.lightElementPrimary,
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.lightElementAccent,
      selectionHandleColor: AppColors.lightElementAccent,
    ),
    listTileTheme: _baseTheme.listTileTheme.copyWith(
      iconColor: AppColors.lightElementPrimary,
      textColor: AppColors.lightElementPrimary,
    ),
    unselectedWidgetColor: AppColors.lightElementAccent,
    toggleableActiveColor: AppColors.lightElementPrimary,
    cardTheme: _baseTheme.cardTheme.copyWith(color: AppColors.lightGray),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.lightGray),
    dividerColor: AppColors.lightElementAccent,
    dialogBackgroundColor: AppColors.lightGray,
    scaffoldBackgroundColor: AppColors.lightGray,
    backgroundColor: AppColors.lightGray,
  );

  static final ThemeData darkTheme = _baseTheme.copyWith(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme(
      primary: AppColors.darkPurple,
      onPrimary: AppColors.darkElementPrimary,
      secondary: AppColors.lightPurple,
      onSecondary: AppColors.darkElementAccent,
      onBackground: AppColors.darkElementPrimary,
      onSurface: AppColors.darkElementPrimary,
      onError: AppColors.darkElementPrimary,
      brightness: Brightness.dark,
      surface: AppColors.lightPurple,
      background: AppColors.darkPurple,
      error: Colors.red,
      tertiary: AppColors.lightPurple,
      secondaryContainer: AppColors.lightPurple,

    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _baseTheme.elevatedButtonTheme.style?.merge(
        ElevatedButton.styleFrom(
          primary: AppColors.darkElementPrimary,
          onPrimary: AppColors.darkPurple,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: _baseTheme.textButtonTheme.style?.merge(
        TextButton.styleFrom(
          primary: AppColors.darkElementPrimary,
        ),
      ),
    ),
    primaryIconTheme: const IconThemeData(color: AppColors.darkElementPrimary),
    iconTheme: const IconThemeData(color: AppColors.darkElementAccent),
    primaryTextTheme: _baseTheme.textTheme.apply(
      bodyColor: AppColors.darkElementPrimary,
      displayColor: AppColors.darkElementPrimary,
    ),
    textTheme: _baseTheme.textTheme.apply(
      bodyColor: AppColors.darkElementAccent,
      displayColor: AppColors.darkElementAccent,
    ),
    inputDecorationTheme: _baseTheme.inputDecorationTheme.copyWith(
      iconColor: AppColors.darkElementAccent,
      labelStyle: const TextStyle(color: AppColors.darkElementPrimary),
      border: _baseTheme.inputDecorationTheme.border?.copyWith(
        borderSide: const BorderSide(
          color: AppColors.darkElementPrimary,
        ),
      ),
      focusedBorder: _baseTheme.inputDecorationTheme.border?.copyWith(
        borderSide: const BorderSide(
          color: AppColors.darkElementPrimary,
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.darkElementAccent,
      selectionHandleColor: AppColors.darkElementAccent,
    ),
    listTileTheme: _baseTheme.listTileTheme.copyWith(
      iconColor: AppColors.darkElementPrimary,
      textColor: AppColors.darkElementPrimary,
    ),
    unselectedWidgetColor: AppColors.darkElementAccent,
    toggleableActiveColor: AppColors.darkElementPrimary,
    cardTheme: _baseTheme.cardTheme.copyWith(color: AppColors.lightPurple),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.darkPurple),
    dividerColor: AppColors.darkElementAccent,
    dialogBackgroundColor: AppColors.lightPurple,
    scaffoldBackgroundColor: AppColors.darkPurple,
    backgroundColor: AppColors.darkPurple,
  );
}

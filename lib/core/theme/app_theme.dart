import 'package:cardinal_quotes_task/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border(Color color, double width) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
        borderRadius: BorderRadius.circular(6),
      );
  static TextStyle textStyle = const TextStyle(
    fontFamily: 'Raleway',
    color: AppPalette.color3,
  );
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppPalette.colorgg,
    splashColor: Colors.transparent,
    highlightColor: AppPalette.color3.withAlpha(50),
    textTheme: TextTheme(
      bodyLarge: textStyle,
      bodyMedium: textStyle,
      bodySmall: textStyle,
      displayLarge: textStyle,
      displayMedium: textStyle,
      displaySmall: textStyle,
      headlineLarge: textStyle,
      headlineMedium: textStyle,
      headlineSmall: textStyle,
      labelLarge: textStyle,
      labelMedium: textStyle,
      labelSmall: textStyle,
      titleLarge: textStyle,
      titleMedium: textStyle,
      titleSmall: textStyle,
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: _border(AppPalette.color3.withAlpha(51), 0.5),
      focusedBorder: _border(AppPalette.color3, 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      isDense: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.color3,
        foregroundColor: AppPalette.color1,
        disabledBackgroundColor: AppPalette.color3.withAlpha(128),
        disabledForegroundColor: AppPalette.color1,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Raleway',
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(
          color: AppPalette.color3,
          width: 1,
        ),
      ),
    ),
  );
}

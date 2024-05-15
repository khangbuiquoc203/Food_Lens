import 'dart:ui';
import 'package:flutter/material.dart';
import '../core/app_export.dart';

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable

class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray700,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: appTheme.gray600,
          fontSize: 15.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 12.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.teal400,
          fontSize: 55.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
        displaySmall: TextStyle(
          color: appTheme.teal400,
          fontSize: 35.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
        headlineLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 28.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.gray700,
          fontSize: 12.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: appTheme.blueGray900,
          fontSize: 14.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.gray800,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: appTheme.teal400,
          fontSize: 40.fSize,
          fontFamily: 'Rounded Mplus 1c Bold',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light();
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);
// BlueGray
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray900 => Color(0XFF333232);
  Color get blueGray50 => Color(0XFFF1F1F1);
// Cyan
  Color get cyan400 => Color(0XFF3ABBD7);
  Color get cyan800 => Color(0XFF1A7B90);
  Color get cyan900 => Color(0XFF06586A);
// Grayb
  Color get gray3009b => Color(0X9BDADADA);
// Gray
  Color get gray500 => Color(0XFFA6A6A6);
  Color get gray600 => Color(0XFF787878);
  Color get gray700 => Color(0XFF565353);
  Color get gray900 => Color(0XFF121212);
  Color get gray90001 => Color(0XFF212121);
// Green
  Color get green900 => Color(0XFF014E0D);
  Color get greenA40014 => Color(0X1400FF47);
// LightBlue
  Color get lightBlue300 => Color(0XFF55E0FF);
// LightGreen
  Color get lightGreenA700 => Color(0XFF0EFF00);
// Teal
  Color get teal400 => Color(0XFF29899E);
// White
  Color get whiteA700 => Color(0XFFFFFFFF);

  // Black
// BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
// Gray
  Color get gray300 => Color(0XFFDFDFDF);
  Color get gray50001 => Color(0XFF959595);
  Color get gray800 => Color(0XFF515050);
// LightBlue
  Color get lightBlueA400 => Color(0XFF00B5FF);
// Red
  Color get redA700 => Color(0XFFFF0000);
// Green
  Color get greenA400 => Color(0XFF00FF4B);

// Blackf
  Color get black9003f => Color(0X3F000000);

}

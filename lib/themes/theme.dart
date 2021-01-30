import 'package:flutter/material.dart';

enum ThemeKeys { LIGHT, DARK }

class Themes {
  static const Color _primaryColor = Color(0xFFf99d32);
  // static const Color _primaryColorDark = Color(0xFFc16e00);
  // static const Color _secondColor = Color(0xFF344968);
  // static const Color _secondDarkColor = Color(0xFFccccdd);
  // static const Color _accentColor = Color(0xFFffce63);
  // static const Color _accentDarkColor = Color(0xFF9999aa);
  static const Color _primaryTextColor = Color(0xFFF212121);
  static const Color _primaryTextColorDark = Color(0xFFFAFAFA);
  static const Color _scaffoldColor = Color(0xFFFAFAFA);
  static const Color _scaffoldDarkColor = Color(0xFF2C2C2C);
  static const Color _professionalColor =
      Color(0xFF337ab7); // TODO Dart Analysis says this is not referenced
  static const Color _personalColor =
      Color(0xFF5cb85c); // TODO Dart Analysis says this is not referenced

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _scaffoldColor,
    accentColor: _primaryColor,
    hintColor: _primaryColor,
    focusColor: Colors.grey,
    textSelectionHandleColor: _primaryColor,
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 20.0, color: _primaryColor),
      headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: _primaryTextColor,
      ),
      headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: _primaryTextColor,
      ),
      headline2: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: _primaryColor,
      ),
      headline1: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: _primaryColor,
      ),
      subtitle1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: _primaryTextColor,
      ),
      headline6: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: _primaryTextColor,
      ),
      bodyText2: TextStyle(fontSize: 12.0, color: _primaryTextColor),
      bodyText1: TextStyle(fontSize: 14.0, color: _primaryTextColor),
      caption: TextStyle(fontSize: 12.0, color: _primaryTextColor),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _primaryColor,
      actionTextColor: _primaryTextColor,
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: _primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _scaffoldDarkColor,
    accentColor: _primaryColor,
    hintColor: _primaryColor,
    focusColor: Colors.grey,
    textSelectionHandleColor: _primaryColor,
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 20.0, color: _primaryTextColorDark),
      headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: _primaryTextColorDark,
      ),
      headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: _primaryTextColorDark,
      ),
      headline2: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        color: _primaryColor,
      ),
      headline1: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: _primaryColor,
      ),
      subtitle1: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        color: _primaryTextColorDark,
      ),
      headline6: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: _primaryTextColorDark,
      ),
      bodyText2: TextStyle(fontSize: 12.0, color: _primaryTextColorDark),
      bodyText1: TextStyle(fontSize: 14.0, color: _primaryTextColorDark),
      caption: TextStyle(fontSize: 12.0, color: _primaryTextColorDark),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _primaryColor,
      actionTextColor: _primaryTextColorDark,
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
    ),
  );

  static ThemeData getThemeFromKey(ThemeKeys themeKey) {
    switch (themeKey) {
      case ThemeKeys.LIGHT:
        return lightTheme;
      case ThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}

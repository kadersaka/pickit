import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pickit/models/language.dart';
import 'package:pickit/utils/constants.dart';
import 'package:pickit/themes/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CustomTheme extends StatefulWidget {
  final Widget child;
  final ThemeKeys initialThemeKey;

  const CustomTheme({
    Key key,
    this.initialThemeKey,
    @required this.child,
  }) : super(key: key);

  @override
  CustomThemeState createState() => CustomThemeState();

  static ThemeData of(BuildContext context) {
    _CustomTheme inherited = (context.inheritFromWidgetOfExactType(_CustomTheme)
    as _CustomTheme); // TODO info: 'inheritFromWidgetOfExactType' is deprecated and shouldn't be used. Use dependOnInheritedWidgetOfExactType instead. This feature was deprecated after v1.12.1.. (deprecated_member_use at [minfo] lib/widgets/custom_theme.dart:39)
    return inherited.data.theme;
  }

  static CustomThemeState instanceOf(BuildContext context) {
    _CustomTheme inherited = (context.inheritFromWidgetOfExactType(_CustomTheme)
    as _CustomTheme); // TODO info: 'inheritFromWidgetOfExactType' is deprecated and shouldn't be used. Use dependOnInheritedWidgetOfExactType instead. This feature was deprecated after v1.12.1.. (deprecated_member_use at [minfo] lib/widgets/custom_theme.dart:45)
    return inherited.data;
  }
}
class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;

  _CustomTheme({
    this.data,
    Key key,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}
class CustomThemeState extends State<CustomTheme> {
  ThemeData _theme;

  ThemeData get theme => _theme;

  @override
  void initState() {
    _theme = Themes.getThemeFromKey(widget.initialThemeKey);
    _fetchPrefValues();
    super.initState();
  }

  void _fetchPrefValues() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final _useDarkTheme = _prefs.getBool(PREFERENCE_DARK_THEME) ?? false;

    if (_useDarkTheme) {
      setState(() {
        _theme = Themes.getThemeFromKey(ThemeKeys.DARK);
      });
    }

    if ((_prefs.getInt(PREFERENCE_LANGUAGE_INDEX) ??
        SYSTEM_LANGUAGE_PREFERENCE) !=
        SYSTEM_LANGUAGE_PREFERENCE) {
      final _language = LANGUAGES[_prefs.getInt(PREFERENCE_LANGUAGE_INDEX)];
      final locale = Locale(_language.languageCode, _language.countryCode);
      setState(() {
//        I18n.locale = locale;
      });
    }
  }

  void changeTheme(ThemeKeys themeKey) {
    setState(() {
      _theme = Themes.getThemeFromKey(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTheme(
      data: this,
      child: widget.child,
    );
  }
}

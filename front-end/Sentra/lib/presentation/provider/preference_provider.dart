import 'package:flutter/material.dart';
import 'package:sentra/data/preferences/preference_helper.dart';
import 'package:common/style.dart';

class PreferenceProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferenceProvider({required this.preferencesHelper}) {
    _getTheme();
    _getDailyRestaurantPreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  bool _isDailyRestaurantActive = false;
  bool get isDailyRestaurantActive => _isDailyRestaurantActive;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void _getDailyRestaurantPreferences() async {
    _isDailyRestaurantActive = await preferencesHelper.isDailyArtActive;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  void enableDailyRestaurant(bool value) {
    preferencesHelper.setDailyArt(value);
    _getDailyRestaurantPreferences();
  }

  Locale _locale = const Locale("id");
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}

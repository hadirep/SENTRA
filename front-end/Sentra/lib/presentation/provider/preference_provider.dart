import 'package:flutter/material.dart';
import 'package:sentra/data/preferences/preference_helper.dart';
import 'package:sentra/common/style.dart';

class PreferenceProvider extends ChangeNotifier{
  PreferencesHelper preferencesHelper;

  PreferenceProvider({required this.preferencesHelper}){
    _getTheme();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }
}
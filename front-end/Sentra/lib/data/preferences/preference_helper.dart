import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> shared;

  static const dark = 'DARK_THEME';

  PreferencesHelper({required this.shared});

  Future<bool> get isDarkTheme async {
    final prefs = await shared;
    return prefs.getBool(dark) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await shared;
    prefs.setBool(dark, value);
  }
}

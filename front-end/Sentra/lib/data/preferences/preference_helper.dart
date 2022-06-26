import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> shared;

  static const dark = 'DARK_THEME';
  static const notif = 'DAILY_NEWS';


  PreferencesHelper({required this.shared});

  Future<bool> get isDarkTheme async {
    final prefs = await shared;
    return prefs.getBool(dark) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await shared;
    prefs.setBool(dark, value);
  }

    Future<bool> get isDailyRestaurantActive async {
    final prefs = await shared;
    return prefs.getBool(notif) ?? false;
  }

  void setDailyRestaurant(bool value) async {
    final prefs = await shared;
    prefs.setBool(notif, value);
  }
}

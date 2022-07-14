import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

// used to save and retrieve the color data

class ThemePreferences {
  static const PREF_KEY = "pref_key";

  setTheme(Color value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(PREF_KEY, value.value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(PREF_KEY);
  }
}

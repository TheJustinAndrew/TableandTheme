import 'package:flutter/material.dart';
import 'package:softinfosystemsproj/Pages/Theme/theme_preference.dart';
import 'package:softinfosystemsproj/Utils/constants.dart';

class ThemeModel extends ChangeNotifier {
  ThemeData _themeData =
      CommonFunction.themeData(themeColor: const Color(0xff000000));
  late ThemePreferences _preferences = ThemePreferences();

  ThemeData get themeData => _themeData;


  ThemeModel() {
    _themeData = CommonFunction.themeData(themeColor: const Color(0xff000000));
    _preferences = ThemePreferences();
    getPreferences();
  }

  set changeColor(Color color) {
    _themeData = CommonFunction.themeData(themeColor: color);
    _preferences.setTheme(color);
    notifyListeners();
  }

  getPreferences() async {
    int color = await _preferences.getTheme();
    _themeData = CommonFunction.themeData(themeColor: Color(color));
    notifyListeners();
  }
}

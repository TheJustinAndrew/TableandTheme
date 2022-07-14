import 'package:flutter/material.dart';

class CommonFunction {
  static themeData({required Color themeColor}) {
    Map<int, Color> color = {
      50: themeColor,
      100: themeColor,
      200: themeColor,
      300: themeColor,
      400: themeColor,
      500: themeColor,
      600: themeColor,
      700: themeColor,
      800: themeColor,
      900: themeColor
    };

    ThemeData themeData = ThemeData(
      appBarTheme: AppBarTheme(
          color: themeColor,
          titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: themeColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white)),
      tabBarTheme: TabBarTheme(indicator: BoxDecoration(color: themeColor)),
      buttonColor: themeColor,
      primaryColor: themeColor,
      textTheme: TextTheme(
        button: TextStyle(
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white),
        caption: TextStyle(
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white),
        headline1: TextStyle(
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white),
        headline2: TextStyle(
            color: themeColor.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white),
// can be used if need to change the text text color in body also but as of now its not necessary as the background color is always white
        // bodyText1: TextStyle(color: Color(color).computeLuminance() > 0.5
        //     ? Colors.black
        //     : Colors.white),
        // bodyText2: TextStyle(color: Color(color).computeLuminance() > 0.5
        //     ? Colors.black
        //     : Colors.white),
        // subtitle1: TextStyle(color: Color(color).computeLuminance() > 0.5
        //     ? Colors.black
        //     : Colors.white),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(themeColor.value, color),
      ),
    );
    return themeData;
  }
}

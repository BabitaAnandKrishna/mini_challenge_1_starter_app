import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  CustomWidgetThemes._(BuildContext context) {
    //todo(you) Modify this so that it has different values for light and dark mode

    final theme = Provider.of<MyTheme>(context).currentTheme;
    switch (theme) {
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.lightBlueAccent.shade200,
          mountainFillColor: Colors.green.shade800,
          waterFillColor: Colors.pinkAccent.shade100,
          drawMoon: false,
          drawSun: true,
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.blueGrey.shade800,
          mountainFillColor: Colors.green.shade800,
          waterFillColor: Colors.pinkAccent.shade100,
          drawMoon: true,
          drawSun: false,
        );
        break;
      case ThemeType.Pastel:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: Colors.lightBlueAccent.shade200,
          mountainFillColor: Colors.green.shade800,
          waterFillColor: Colors.pinkAccent.shade100,
          drawMoon: true,
          drawSun: true,
        );
        break;
    }
  }
}

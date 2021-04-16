import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[100],
          accentColor: Colors.yellow,
          canvasColor: (Color(0xFFc4fb9c)).withOpacity(0.9),
          fontFamily:'Parisienne' ,
          appBarTheme: AppBarTheme(
            centerTitle:true,
            textTheme: TextTheme(headline6:  TextStyle(fontSize: 23,fontFamily: 'Parisienne',fontWeight: FontWeight.bold,).apply(color: Colors.blueAccent))
          ),
          textTheme:  TextTheme(
            bodyText1: TextStyle(fontWeight: FontWeight.bold,fontSize: 18).apply(color: Colors.green),
              subtitle1: TextStyle(fontWeight: FontWeight.bold,fontSize: 18).apply(color: Colors.brown),
          ),

        );
      case ThemeType.Dark:
        return ThemeData(
           brightness: Brightness.dark,
          fontFamily:'Parisienne' ,
          appBarTheme: AppBarTheme(
              centerTitle:true,
              textTheme: TextTheme(headline6:  TextStyle(fontSize: 23,fontFamily: 'Parisienne',fontWeight: FontWeight.bold,))
          ),
          textTheme:  TextTheme(
            bodyText1: TextStyle( fontWeight: FontWeight.normal,fontSize: 18),
            subtitle1: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
          ),
        );
      case ThemeType.Other:
        return ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle:true,
          ),
        );
    }
  }
}

enum ThemeType {
  Light,
  Dark,
  Other,
}

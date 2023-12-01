import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeController extends ChangeNotifier {
  bool dark = true;
  Color primaryColor = Colors.green;
  Color textColor = Colors.black;
  Color backgroundColor = Colors.white;
  int fontsize = 16;
  bool loading = false;

  Color newPrimaryColor = Colors.green;
  Color newBackgroundColor = Colors.green;
  Color newTextColor = Colors.green;

  updateColors() {
    backgroundColor = newBackgroundColor;
    primaryColor = newPrimaryColor;
    textColor = newTextColor;
    notifyListeners();
  }

  ThemeData get getThemeData {
    return ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      inputDecorationTheme: InputDecorationTheme(
        // labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(
          fontSize: (fontsize - 4).sp.clamp(12, 16),
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: (fontsize).sp.clamp(20, 24),
          color: textColor,
        ),
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: (fontsize - 2).sp.clamp(17, 20),
            color: textColor),
        bodyText1: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: (fontsize - 3).sp.clamp(14, 16),
            color: textColor),
      ),
    );
  }

  _getMaterial(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

  void changetextColor(Color color) {
    newTextColor = color;
    notifyListeners();
  }

  void changebackgroundColor(Color color) {
    newBackgroundColor = color;
    notifyListeners();
  }

  void changeprimaryColor(Color color) {
    print('changeprimaryColor');
    newPrimaryColor = color;
    notifyListeners();
  }

  // updateColors(Color? ntextColor, Color? nprimaryColor, int? newfontsize,
  //     Color backgroundColorr) {
  //   textColor = ntextColor ?? textColor;
  //   if (nprimaryColor != null) {
  //     primaryColor = nprimaryColor;
  //   }
  //   fontsize = newfontsize ?? fontsize;
  //   backgroundColor = backgroundColorr;
  //   debugPrint('theme updated');
  //   notifyListeners();
  // }
}

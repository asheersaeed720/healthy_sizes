import 'package:flutter/material.dart';

const String fontName = 'Montserrat';

final lightThemeData = ThemeData(
  // colorScheme: ColorScheme.fromSwatch(primarySwatch: customPrimaryColor).copyWith(
  //   secondary: customAccentColor,
  // ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: customPrimaryColor),
  errorColor: Colors.red[800],
  iconTheme: IconThemeData(color: Colors.grey.shade800),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: fontName,
);

Map<int, Color> color = const {
  50: Color.fromRGBO(223, 1, 165, .1),
  100: Color.fromRGBO(223, 1, 165, .2),
  200: Color.fromRGBO(223, 1, 165, .3),
  300: Color.fromRGBO(223, 1, 165, .4),
  400: Color.fromRGBO(223, 1, 165, .5),
  500: Color.fromRGBO(223, 1, 165, .6),
  600: Color.fromRGBO(223, 1, 165, .7),
  700: Color.fromRGBO(223, 1, 165, .8),
  800: Color.fromRGBO(223, 1, 165, .9),
};

MaterialColor customPrimaryColor = MaterialColor(0xFFDF01A5, color);

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../domain/responsive/dimensions.dart';
import 'color.dart';

MaterialColor colorPrimarySwatch = const MaterialColor(
  0xff3e0d69,
  <int, Color>{
    50: Color(0xff3e0d69),
    100: Color(0xff3e0d69),
    200: Color(0xff3e0d69),
    300: Color(0xff3e0d69),
    400: Color(0xff3e0d69),
    500: Color(0xff3e0d69),
    600: Color(0xff3e0d69),
    700: Color(0xff3e0d69),
    800: Color(0xff3e0d69),
    900: Color(0xff3e0d69),
  },
);

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
      primarySwatch: colorPrimarySwatch,
      backgroundColor: LightColor.whitebackground,
      scaffoldBackgroundColor: Colors.grey.shade100,
      primaryColor: LightColor.primaryColor,
      cardTheme: const CardTheme(color: Colors.white),
      textTheme: const TextTheme(bodyText1: TextStyle(color: LightColor.black)),
      // iconTheme: IconThemeData(color: LightColor.iconColor),
      bottomAppBarColor: LightColor.whitebackground,
      dividerColor: LightColor.lightGrey,
      primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: LightColor.titleTextColor)));

// *-*-*-*-*-
  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style = const TextStyle(
    fontSize: 24,
  );
  static TextStyle h2Style = const TextStyle(fontSize: 25);
  static TextStyle h3Style = const TextStyle(fontSize: 27);
  static TextStyle h4Style =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  static TextStyle h5Style = const TextStyle(fontSize: 30);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
  static TextStyle h7Style = const TextStyle(fontSize: 12);
  static TextStyle h8Style =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static TextStyle appBarText =
      const TextStyle(fontSize: 16, color: Colors.white);

  static TextStyle h5StyleBold = TextStyle(
      fontSize: customFontSize(11),
      fontWeight: FontWeight.bold,
      color: Colors.black,
      overflow: TextOverflow.ellipsis);

  static TextStyle h5headingBold = TextStyle(
    color: LightColor.black,
    fontWeight: FontWeight.bold,
    fontSize: customFontSize(5),
  );

  static TextStyle h6StyleBold = TextStyle(
    color: Color.fromARGB(255, 84, 83, 83),
    fontWeight: FontWeight.bold,
    fontSize: customFontSize(7),
  );

// *-*-*-*-*
  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

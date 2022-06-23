import 'package:flutter/material.dart';

class AppTheme {
  //App related strings
  static String appTitle = 'Action Kids';

  //App values to adjust
  static double elevation = 1;
  static double smallFontSize = 16;
  static double mediumFontSize = 20;
  static double largeFontSize = 28;

  //Colors for theme
  static Color lightPrimary = Color(0xff0274BE);
  static Color lightAccent = Color(0xffF56C24);
  static Color lightBG = Color(0xffF3F4F9);
  static Color lightCard = Color(0xffFFFFFF);
  static Color lightText = Color(0xff303030);

  static Color darkPrimary = Color(0xffF56C24);
  static Color darkAccent = Color(0xff0274BE);
  static Color darkBG = Color(0xff2B2B2B);
  static Color darkCard = Color(0xff383838);
  static Color darkText = Color(0xffF5F5F5);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    cardColor: lightCard,
    fontFamily: 'OpenSans',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: lightText,
        fontSize: largeFontSize,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
        color: lightText,
        fontSize: mediumFontSize,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        color: lightText,
        fontSize: smallFontSize,
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
          color: lightText,
          fontSize: mediumFontSize,
          fontWeight: FontWeight.w600,
        )),
        foregroundColor: MaterialStateProperty.all<Color>(lightPrimary),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
          color: lightText,
          fontSize: mediumFontSize,
          fontWeight: FontWeight.w600,
        )),
        backgroundColor: MaterialStateProperty.all<Color>(lightPrimary),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(12),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: lightText),
    appBarTheme: AppBarTheme(
      color: lightBG,
      iconTheme: IconThemeData(color: lightText),
      brightness: Brightness.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    cardColor: darkCard,
    fontFamily: 'OpenSans',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: darkText,
        fontSize: largeFontSize,
        fontWeight: FontWeight.w800,
      ),
      headline2: TextStyle(
        color: darkText,
        fontSize: mediumFontSize,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        color: darkText,
        fontSize: smallFontSize,
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
          color: darkText,
          fontSize: mediumFontSize,
          fontWeight: FontWeight.w600,
        )),
        foregroundColor: MaterialStateProperty.all<Color>(darkPrimary),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
          color: darkText,
          fontSize: mediumFontSize,
          fontWeight: FontWeight.w600,
        )),
        backgroundColor: MaterialStateProperty.all<Color>(darkPrimary),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.all(12),
        ),
      ),
    ),
    iconTheme: IconThemeData(color: darkText),
    appBarTheme: AppBarTheme(
      color: darkBG,
      iconTheme: IconThemeData(color: darkText),
      brightness: Brightness.dark,
    ),
  );
}

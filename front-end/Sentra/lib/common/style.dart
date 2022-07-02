import 'package:flutter/material.dart';
import 'package:sentra/common/text_theme.dart';

const Color primaryColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color.fromRGBO(220, 126, 0, 1);
const Color buttonPrimaryColor = Color.fromRGBO(85, 110, 172, 1);
const Color textPrimaryColor = Color(0xff2d4b94);
const Color textSecondColor = Color(0xff626262);
const Color bgSecondColor = Color.fromRGBO(252, 241, 215, 1);
const Color backgroundColor = Color.fromRGBO(255, 219, 128, 1);
const Color darkPrimaryColor = Color(0xFF000000);
const Color darkSecondaryColor = Color(0xff64ffda);
const Color darkTextPrimaryColor = Color(0xFFFFFFFF);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: secondaryColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: myTextTheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: primaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: secondaryColor,
          onPrimary: Colors.white,
          textStyle: const TextStyle(),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              )))),
  visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: darkPrimaryColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: darkSecondaryColor,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: myTextTheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
    toolbarTextStyle: myTextTheme.apply(bodyColor: Colors.white).bodyText2,
    titleTextStyle: myTextTheme.apply(bodyColor: Colors.white).headline6,
    backgroundColor: darkPrimaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          primary: darkSecondaryColor,
          onPrimary: Colors.white,
          textStyle: const TextStyle(),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              )))),
  visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkSecondaryColor),
);

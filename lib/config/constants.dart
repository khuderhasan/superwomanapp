import 'package:flutter/material.dart';

const double defaultPadding = 16.0;
const errorColor = Color.fromARGB(255, 190, 18, 5);
const kPrimaryColor = Color.fromARGB(255, 195, 85, 91);
const kPrimaryLightColor = Color(0xFFC9D7C6);
const headLines1Color = Color.fromARGB(255, 26, 79, 114);
const headLines2Color = Color.fromARGB(255, 37, 112, 40);
const headLines1TextStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 21, color: headLines1Color);
const headLines2TextStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: headLines2Color);

final appTheme = ThemeData(
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: const Color.fromARGB(255, 219, 216, 214),
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 219, 216, 214),
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 23, color: headLines1Color),
    centerTitle: true,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromARGB(255, 172, 171, 170),
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: kPrimaryColor,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kPrimaryLightColor,
    iconColor: kPrimaryColor,
    prefixIconColor: kPrimaryColor,
    hintStyle: TextStyle(fontWeight: FontWeight.bold),
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
);

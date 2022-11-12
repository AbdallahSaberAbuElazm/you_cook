import 'package:flutter/material.dart';
import 'package:you_cook/core/styles/color.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: scaffoldBackground,
      colorScheme: const ColorScheme.light(secondary: redColor),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: redColor,
          selectionColor: lightGreyColor,
          selectionHandleColor: redColor),
      fontFamily: 'NotoKufiArabic',
      textTheme: textTheme(),
      iconTheme: const IconThemeData(color: whiteColor),
      elevatedButtonTheme: elevatedButtonThemeData());
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: redColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: whiteColor,
        fontSize: 38,
        fontFamily: 'NotoKufiArabic',
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: whiteColor,
        fontSize: 29,
        fontFamily: 'NotoKufiArabic',
        fontWeight: FontWeight.bold),
    headline3: TextStyle(
        fontSize: 19,
        fontFamily: 'NotoKufiArabic',
        color: blackColor,
        fontWeight: FontWeight.w400),
    headline4: TextStyle(
        color: lightBlackColor,
        fontSize: 19,
        fontWeight: FontWeight.w400,
        fontFamily: 'NotoKufiArabic'),
    headline5: TextStyle(color: whiteColor, fontSize: 17),
    headline6: TextStyle(
      color: blackColor,
      fontSize: 8.8,
      fontFamily: 'NotoKufiArabic',
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      fontFamily: 'NotoKufiArabic',
      color: blackColor,
    ),
    bodyText2: TextStyle(
      color: blackColor,
      fontSize: 14,
      fontFamily: 'NotoKufiArabic',
    ),
  );
}

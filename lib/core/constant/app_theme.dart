import 'package:deliveryapplication/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

ThemeData appThemeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  scaffoldBackgroundColor: ColorConstant.whitePrimary,
  cardTheme: CardThemeData(color: ColorConstant.whitePrimary),
  appBarTheme: AppBarThemeData(
    iconTheme: IconThemeData(color: ColorConstant.puplerDistinct),
    backgroundColor: ColorConstant.whitePrimary,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: ColorConstant.puplerDistinct,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    ),
  ),
  dialogTheme: DialogThemeData(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorConstant.puplerDistinct,
    ),
    backgroundColor: ColorConstant.whitePrimary,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorConstant.puplerDistinct,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: ColorConstant.puplerDistinct,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.puplerLight,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: ColorConstant.greyPrimary, fontSize: 20),
  ),
);
ThemeData appThemeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: ColorConstant.puplerDistinct,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: ColorConstant.puplerLight,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(color: ColorConstant.greyPrimary, fontSize: 20),
  ),
);

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightThemeColors.iconColor
            : DarkThemeColors.iconColor,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle:
            getTextTheme(isLightTheme: isLightTheme).bodyLarge!.copyWith(
                  color: Colors.white,
                  fontSize: MyFonts.appBarTittleSize,
                ),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightThemeColors.appBarIconsColor
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightThemeColors.appBarColor
            : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        labelLarge: MyFonts.buttonTextStyle
            .copyWith(fontSize: MyFonts.buttonTextSize),
        bodyLarge: (MyFonts.bodyTextStyle).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: MyFonts.body1TextSize,
            color: isLightTheme
                ? LightThemeColors.bodyTextColor
                : DarkThemeColors.bodyTextColor),
        bodyMedium: (MyFonts.bodyTextStyle).copyWith(
            fontSize: MyFonts.body2TextSize,
            color: isLightTheme
                ? LightThemeColors.bodyTextColor
                : DarkThemeColors.bodyTextColor),
        displayLarge: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline1TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        displayMedium: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline2TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        displaySmall: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline3TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        headlineMedium: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline4TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        headlineSmall: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline5TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        titleLarge: (MyFonts.headlineTextStyle).copyWith(
            fontSize: MyFonts.headline6TextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightThemeColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        bodySmall: TextStyle(
            color: isLightTheme
                ? LightThemeColors.captionTextColor
                : DarkThemeColors.captionTextColor,
            fontSize: MyFonts.captionTextSize),
      );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme
          ? LightThemeColors.chipBackground
          : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme
          ? LightThemeColors.chipTextColor
          : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static WidgetStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: isLightTheme
                  ? LightThemeColors.buttonTextColor
                  : DarkThemeColors.buttonTextColor);
        } else if (states.contains(WidgetState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isLightTheme
                  ? LightThemeColors.buttonDisabledTextColor
                  : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme
                ? LightThemeColors.buttonTextColor
                : DarkThemeColors
                    .buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
          padding:
              WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 8.h)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return isLightTheme
                    ? LightThemeColors.buttonColor.withOpacity(0.5)
                    : DarkThemeColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(WidgetState.disabled)) {
                return isLightTheme
                    ? LightThemeColors.buttonDisabledColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightThemeColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );
}

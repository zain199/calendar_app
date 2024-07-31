import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/colors.dart';

ThemeData getLightTheme = ThemeData(
  primaryColor: AppColors.whiteColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0, foregroundColor: AppColors.whiteColor),
  brightness: Brightness.light,
  cardColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: AppColors.mainColor,
    secondary: AppColors.lightMainColor,
    surface: AppColors.whiteColor,
    onSurface: AppColors.greyColor,
    primaryContainer: AppColors.textColor,
    onPrimary: AppColors.darkMainColor,
  ),
  fontFamily: "Urbanist",
  textTheme: GoogleFonts.urbanistTextTheme(TextTheme(
    headlineLarge: GoogleFonts.urbanist(
      fontSize: 36.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.4,
    ),
    headlineMedium: GoogleFonts.urbanist(
      fontSize: 32.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.3,
    ),
    headlineSmall: GoogleFonts.urbanist(
      fontSize: 30.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.4,
    ),
    displayLarge: GoogleFonts.urbanist(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
      height: 1.3,
    ),
    displayMedium: GoogleFonts.urbanist(
      fontSize: 26.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.3,
    ),
    displaySmall: GoogleFonts.urbanist(
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.3,
    ),
    titleMedium: GoogleFonts.urbanist(
      fontSize: 22.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.2,
    ),
    titleSmall: GoogleFonts.urbanist(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.2,
    ),
    bodyLarge: GoogleFonts.urbanist(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.2,
    ),
    bodyMedium: GoogleFonts.urbanist(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.2,
    ),
    bodySmall: GoogleFonts.urbanist(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
      height: 1.2,
    ),
  )),
);

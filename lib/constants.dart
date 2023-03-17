import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

final primaryColor = Colors.blue;
final secondaryColor = Color(0xFF03DAC6);
final backgroundColor = Color(0xFFF5F5F5);

final headerTextStyle = GoogleFonts.roboto(
  fontSize: 32.sp,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

final bodyTextStyle = GoogleFonts.roboto(
  fontSize: 16.sp,
  color: Colors.black87,
);
final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    padding: EdgeInsets.symmetric(
      horizontal: 32.w,
      vertical: 10.h,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    textStyle: GoogleFonts.roboto(
      textStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: secondaryColor,
      ),
    ),
  ),
);

final themeData = ThemeData(
  elevatedButtonTheme: elevatedButtonTheme,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  textTheme:
      TextTheme(bodyMedium: bodyTextStyle, headlineMedium: headerTextStyle),
);

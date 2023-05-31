import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/utils.dart/palettes.dart';

class AppTheme {
  double bodyMargin = 30.w;

  ThemeData theme() {
    return ThemeData(
      primarySwatch: MaterialColor(0xFF0066FF, {
        50: primaryBlue.withOpacity(0.05),
        100: primaryBlue.withOpacity(0.1),
        200: primaryBlue.withOpacity(0.2),
        300: primaryBlue.withOpacity(0.3),
        400: primaryBlue.withOpacity(0.4),
        500: primaryBlue.withOpacity(0.5),
        600: primaryBlue.withOpacity(0.6),
        700: primaryBlue.withOpacity(0.7),
        800: primaryBlue.withOpacity(0.8),
        900: primaryBlue.withOpacity(0.9),
      }),
      primaryColor: primaryBlue,
      // highlightColor: Colors.transparent,
      // inputDecorationTheme: InputDecorationTheme(
      //   errorStyle: TextStyle(fontFamily: 'Gilroy'),
      //   enabledBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Color(0xFFCCCCCC)),
      //   ),
      //   focusedBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Colors.white),
      //   ),
      //   errorBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Colors.red),
      //   ),
      //   focusedErrorBorder: UnderlineInputBorder(
      //     borderSide: BorderSide(color: Colors.red),
      //   ),
      // ),
      scaffoldBackgroundColor: backgroundColor,
      // iconTheme: IconThemeData(color: white),
      // primaryIconTheme: IconThemeData(color: white),
      // appBarTheme: AppBarTheme(
      //   actionsIconTheme: IconThemeData(color: white),
      //   iconTheme: IconThemeData(color: white),
      //   titleTextStyle: TextStyle(
      //     fontSize: 22.sp,
      //     fontWeight: FontWeight.w700,
      //     color: white,
      //     fontFamily: 'Gilroy',
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      buttonTheme: ButtonThemeData(
        buttonColor: primaryGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7,
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w900,
          color: white,
          fontFamily: 'BrandingSF',
        ),
        headline2: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w800,
          color: white,
          fontFamily: 'Gilroy',
        ),
        headline3: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w900,
          color: white,
          fontFamily: 'BrandingSF',
        ),
        headline4: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
          color: white,
          fontFamily: 'Gilroy',
        ),
        headline6: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: white,
          fontFamily: 'Gilroy',
        ),
        bodyText1: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: white,
          fontFamily: 'Gilroy',
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: white,
          fontFamily: 'Gilroy',
        ),
        subtitle1: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: white,
          fontFamily: 'Gilroy',
        ),
        subtitle2: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          color: white,
          fontFamily: 'Gilroy',
        ),
      ).apply(
        bodyColor: white,
        displayColor: white,
      ),
    );
  }
}

SizedBox verticalSpace(double h) => SizedBox(height: h);
SizedBox horizontalSpace(double w) => SizedBox(width: w);

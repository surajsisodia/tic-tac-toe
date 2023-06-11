import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/utils/palettes.dart';

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      dialogTheme: DialogTheme(backgroundColor: Color(0xFF1F1F1F)),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: TextTheme(
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
      ).apply(
        bodyColor: white,
        displayColor: white,
      ),
    );
  }
}

SizedBox verticalSpace(double h) => SizedBox(height: h);
SizedBox horizontalSpace(double w) => SizedBox(width: w);

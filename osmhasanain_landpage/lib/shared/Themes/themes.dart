import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class CustomThemes {
  static final ThemeData webTheme = ThemeData(
    fontFamily: 'Nunito',
    useMaterial3: true,
    scaffoldBackgroundColor: Color.fromARGB(255, 20, 20, 20),
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 35.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      labelMedium: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whiteColor,
      ),
    ),
  );
  static final ThemeData mobileTheme = ThemeData(
    fontFamily: 'Nunito',
    useMaterial3: true,
    scaffoldBackgroundColor: Color.fromARGB(255, 20, 20, 20),
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 50.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      labelMedium: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      labelSmall: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.whiteColor,
      ),
    ),
  );
}

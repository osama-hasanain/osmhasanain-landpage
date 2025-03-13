import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class CustomThemes {
  // TODO: Add a light theme
  // static final ThemeData lightTheme = ThemeData(
  //   primarySwatch: Colors.blue,
  //   brightness: Brightness.light,
  //   appBarTheme: AppBarTheme(
  //     color: Colors.blue,
  //     textTheme: TextTheme(
  //       headline6: TextStyle(
  //         color: Colors.white,
  //         fontSize: 20,
  //       ),
  //     ),
  //   ),
  //   buttonTheme: ButtonThemeData(
  //     buttonColor: Colors.blue,
  //     textTheme: ButtonTextTheme.primary,
  //   ),
  // );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 35.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.whiteColor,
      ),
    ),
  );
}

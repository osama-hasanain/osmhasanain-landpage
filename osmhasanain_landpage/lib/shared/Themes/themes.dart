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
}

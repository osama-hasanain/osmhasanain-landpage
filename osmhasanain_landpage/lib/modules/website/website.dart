import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/home.dart';
import 'package:osmhasanain_landpage/shared/Themes/themes.dart';

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1512, 982),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomThemes.darkTheme,
        home: MyHomePage(),
      ),
    );
  }
}

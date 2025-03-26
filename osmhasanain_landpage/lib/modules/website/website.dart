import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/home.dart';
import 'package:osmhasanain_landpage/shared/Themes/themes.dart';
import '../../shared/resources/localization_service.dart';
import 'dart:html' as html;

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
        locale: getLocaleFromBrowser(),
        fallbackLocale: const Locale('en', 'US'),
        translations: LocalizationService(),
        home: MyHomePage(),
      ),
    );
  }

  Locale getLocaleFromBrowser() {
    String browserLang = html.window.navigator.language;
    List<String> langParts = browserLang.split('-');
    return Locale(langParts[0], langParts.length > 1 ? langParts[1] : '');
  }
}

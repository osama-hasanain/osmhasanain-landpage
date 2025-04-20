import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/home.dart';
import 'package:osmhasanain_landpage/shared/Themes/themes.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';
import '../../shared/resources/localization_service.dart';
import 'dart:html' as html;

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 700) {
      Constants.isMobileScreen = true;
    }

    return ScreenUtilInit(
      designSize: const Size(1512, 982),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) => GetMaterialApp(
        title: 'Osama Hasanain - Applications Developer',
        debugShowCheckedModeBanner: false,
        theme: Constants.isMobileScreen
            ? CustomThemes.mobileTheme
            : CustomThemes.webTheme,
        locale: getLocaleFromBrowser(),
        fallbackLocale: const Locale('en', 'US'),
        translations: LocalizationService(),
        home: MyHomePage(),
        builder: (context, child) {
          return Title(
            title: 'tab_title'.tr,
            color: Colors.black,
            child: child!,
          );
        },
      ),
    );
  }

  Locale getLocaleFromBrowser() {
    String browserLang = html.window.navigator.language;
    List<String> langParts = browserLang.split('-');
    return Locale(langParts[0], langParts.length > 1 ? langParts[1] : '');
  }
}

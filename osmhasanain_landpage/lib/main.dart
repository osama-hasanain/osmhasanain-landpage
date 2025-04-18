import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:osmhasanain_landpage/firebase_options.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/modules/website/website.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(HomeController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyWebsite());
  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

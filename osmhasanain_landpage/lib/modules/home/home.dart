import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.drawerColor,
                  ),
                )),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 100.h,
                      ),
                      Text(
                        'Mobile Apps Developer Expert',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Passionate mobile developer crafting high-performance, user-friendly apps for iOS and Android. Expertise in Flutter and native development to bring ideas to life with seamless experiences 🚀',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        'Skills',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: HomeData.homeData
                            .map(
                              (Map<String, dynamic> data) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: SvgPicture.asset(data['icon'],
                                    height: 70.h,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.whiteColor, BlendMode.srcIn)),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

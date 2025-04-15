import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/contact_me_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/menu_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/positions_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/skills_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/work_gallery_widget.dart';
import 'package:osmhasanain_landpage/shared/resources/assets_managers.dart';
import 'package:osmhasanain_landpage/shared/resources/localization_service.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.initAnimationController(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
                animation: controller.menuAnimation,
                builder: (context, child) {
                  return PositionedDirectional(
                    top: 0,
                    bottom: 0,
                    start: controller.menuAnimation.value,
                    child: MenuHomeWidget(onListItemTap: (index) {
                      if (!controller.animateRun) {
                        controller.onMenuItemTap(index);
                        controller.animateScrollToIndex(index);
                      }
                    }),
                  );
                }),
            AnimatedBuilder(
                animation: controller.homeAnimation,
                builder: (context, child) {
                  return PositionedDirectional(
                      bottom: 0,
                      top: controller.homeAnimation.value,
                      end: 0,
                      start: 300.w,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.w),
                        child: SingleChildScrollView(
                          controller: controller.scrollController,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 50.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Tooltip(
                                    message: 'change_language'.tr,
                                    child: GestureDetector(
                                      onTap: () {
                                        LocalizationService.changeLocale(
                                            Get.locale?.languageCode == 'en'
                                                ? 'ar'
                                                : 'en',
                                            Get.locale?.languageCode == 'en'
                                                ? 'EG'
                                                : 'US');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(10.r)),
                                        padding: EdgeInsets.all(5.w),
                                        child: SvgPicture.asset(
                                          IconsManager.iconsLanguage,
                                          height: 30.h,
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.blackColor,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 100.h,
                              ),
                              Text(
                                'job_title'.tr,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'short_desc'.tr,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 100.h,
                              ),
                              PositionsWidget(),
                              SizedBox(
                                height: 50.h,
                              ),
                              SkillsWidget(),
                              SizedBox(
                                height: 100.h,
                              ),
                              WorkGalleryWidget(),
                              SizedBox(
                                height: 100.h,
                              ),
                              ContactUsWidget()
                            ],
                          ),
                        ),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}

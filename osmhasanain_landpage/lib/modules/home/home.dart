import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/blogs_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/contact_me_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/menu_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/positions_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/skills_widget.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/work_gallery_widget.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';
import 'package:osmhasanain_landpage/shared/resources/assets_managers.dart';
import 'package:osmhasanain_landpage/shared/resources/localization_service.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.initAnimationController(this);
    controller.getBlogsList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !Constants.isMobileScreen ? null : AppBar(),
      drawer: !Constants.isMobileScreen
          ? null
          : Drawer(
              child: MenuHomeWidget(onListItemTap: (index) {
                if (!controller.animateRun) {
                  controller.onMenuItemTap(index);
                  controller.animateScrollToIndex(index);
                  if (Constants.isMobileScreen) {
                    Navigator.pop(context);
                  }
                }
              }),
            ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (!Constants.isMobileScreen)
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
                            if (Constants.isMobileScreen) {
                              Navigator.pop(context);
                            }
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
                        start: Constants.isMobileScreen ? 0 : 300.w,
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
                                    IconButton(
                                      onPressed: () {
                                        LocalizationService.changeLocale(
                                            Get.locale?.languageCode == 'en'
                                                ? 'ar'
                                                : 'en',
                                            Get.locale?.languageCode == 'en'
                                                ? 'EG'
                                                : 'US');
                                      },
                                      icon: Row(children: [
                                        Text(
                                          'change_language'.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: AppColors.whiteColor),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        SvgPicture.asset(
                                          IconsManager.iconsLanguage,
                                          height: 30.h,
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.whiteColor,
                                              BlendMode.srcIn),
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      Constants.isMobileScreen ? 30.h : 100.h,
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
                                  height:
                                      Constants.isMobileScreen ? 30.h : 100.h,
                                ),
                                SkillsWidget(),
                                SizedBox(
                                  height:
                                      Constants.isMobileScreen ? 30.h : 80.h,
                                ),
                                PositionsWidget(),
                                if (!Constants.isMobileScreen)
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                WorkGalleryWidget(),
                                const BlogsWidget(),
                                SizedBox(
                                  height:
                                      Constants.isMobileScreen ? 50.h : 100.h,
                                ),
                                const ContactUsWidget(),
                                SizedBox(
                                  height: 50.h,
                                ),
                              ],
                            ),
                          ),
                        ));
                  }),
            ],
          ),
        );
      }),
    );
  }
}

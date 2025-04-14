import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/menu_widget.dart';
import 'package:osmhasanain_landpage/shared/resources/assets_managers.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
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
                              Text(
                                'positions'.tr,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: HomeData.positionsItems
                                      .map((item) => Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 50.h),
                                            child: MouseRegion(
                                              onEnter: (_) {
                                                // if()
                                                controller
                                                    .changePositionsItemHover(
                                                        true);
                                                controller.positionsHoverId =
                                                    item['id'];
                                              },
                                              onExit: (_) {
                                                controller
                                                    .changePositionsItemHover(
                                                        false);
                                                controller.positionsHoverId = 0;
                                              },
                                              child: GetBuilder<HomeController>(
                                                  builder: (_) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    TweenAnimationBuilder(
                                                        tween: Tween<double>(
                                                            begin: controller
                                                                        .isPositionsItemHover &&
                                                                    controller
                                                                            .positionsHoverId ==
                                                                        item[
                                                                            'id']
                                                                ? Theme.of(context)
                                                                    .textTheme
                                                                    .labelSmall
                                                                    ?.fontSize
                                                                : Theme.of(context)
                                                                    .textTheme
                                                                    .labelMedium
                                                                    ?.fontSize,
                                                            end: controller.isPositionsItemHover && controller.positionsHoverId == item['id']
                                                                ? Theme.of(context)
                                                                    .textTheme
                                                                    .labelMedium
                                                                    ?.fontSize
                                                                : Theme.of(context)
                                                                    .textTheme
                                                                    .labelSmall
                                                                    ?.fontSize),
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        builder: (context,
                                                            value, child) {
                                                          return Text(
                                                            Get.locale?.languageCode ==
                                                                    'en'
                                                                ? item[
                                                                    'title_en']
                                                                : item['title_ar'] ??
                                                                    item[
                                                                        'title_en'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelSmall
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        value),
                                                          );
                                                        }),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TweenAnimationBuilder(
                                                        tween: Tween<double>(
                                                            begin: controller
                                                                        .isPositionsItemHover &&
                                                                    controller
                                                                            .positionsHoverId ==
                                                                        item[
                                                                            'id']
                                                                ? Theme.of(context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.fontSize
                                                                : Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium
                                                                    ?.fontSize,
                                                            end: controller.isPositionsItemHover && controller.positionsHoverId == item['id']
                                                                ? Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium
                                                                    ?.fontSize
                                                                : Theme.of(context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.fontSize),
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        builder: (context,
                                                            value, child) {
                                                          return Text(
                                                            item['time'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .greyWhiteColor,
                                                                    fontSize:
                                                                        value),
                                                          );
                                                        }),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TweenAnimationBuilder(
                                                        tween: Tween<double>(
                                                            begin: controller
                                                                        .isPositionsItemHover &&
                                                                    controller
                                                                            .positionsHoverId ==
                                                                        item[
                                                                            'id']
                                                                ? Theme.of(context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.fontSize
                                                                : Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium
                                                                    ?.fontSize,
                                                            end: controller.isPositionsItemHover && controller.positionsHoverId == item['id']
                                                                ? Theme.of(context)
                                                                    .textTheme
                                                                    .bodyMedium
                                                                    ?.fontSize
                                                                : Theme.of(context)
                                                                    .textTheme
                                                                    .bodySmall
                                                                    ?.fontSize),
                                                        duration: const Duration(
                                                            milliseconds: 100),
                                                        builder: (context,
                                                            value, child) {
                                                          return Text(
                                                            Get.locale?.languageCode ==
                                                                    'en'
                                                                ? item[
                                                                    'desc_en']
                                                                : item['desc_ar'] ??
                                                                    item[
                                                                        'desc_en'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .greyWhiteColor,
                                                                    fontSize:
                                                                        value),
                                                          );
                                                        }),
                                                  ],
                                                );
                                              }),
                                            ),
                                          ))
                                      .toList()),
                              SizedBox(
                                height: 50.h,
                              ),
                              Text(
                                'skills'.tr,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              SizedBox(
                                  height: 100.h,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: HomeData.homeData.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w),
                                      child: MouseRegion(
                                        onEnter: (_) {
                                          controller
                                              .changeSkillsIconHover(true);
                                          controller.skillsHoverId =
                                              HomeData.homeData[index]['id'];
                                        },
                                        onExit: (_) {
                                          controller
                                              .changeSkillsIconHover(false);
                                          controller.skillsHoverId = 0;
                                        },
                                        child: Tooltip(
                                          message: HomeData.homeData[index]
                                              ['hint'],
                                          child: GetBuilder<HomeController>(
                                              builder: (context) {
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.easeInOutBack,
                                              height: HomeData.homeData[index]
                                                          ['id'] ==
                                                      controller.skillsHoverId
                                                  ? controller.skillsIconHeight
                                                  : controller
                                                      .skillsIconHeightNotHover,
                                              width: HomeData.homeData[index]
                                                          ['id'] ==
                                                      controller.skillsHoverId
                                                  ? controller.skillsIconHeight
                                                  : controller
                                                      .skillsIconHeightNotHover,
                                              child: SvgPicture.asset(
                                                  HomeData.homeData[index]
                                                      ['icon'],
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                          AppColors.whiteColor,
                                                          BlendMode.srcIn)),
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 100.h,
                              ),
                              Text(
                                'work_gallery'.tr,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Column(
                                  children: HomeData.worksGalleryItems
                                      .map((item) => Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 50.h),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 80.w,
                                                  height: 80.h,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              item['img']),
                                                          fit: BoxFit.cover),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r)),
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        item['title'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Text(
                                                        Get.locale?.languageCode ==
                                                                'en'
                                                            ? item['desc_en']
                                                            : item['desc_ar'] ??
                                                                item['desc_en'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                      .toList()),
                              SizedBox(
                                height: 100.h,
                              )
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

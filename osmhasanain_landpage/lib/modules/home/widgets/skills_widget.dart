import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class SkillsWidget extends StatefulWidget {
  const SkillsWidget({super.key});

  @override
  State<SkillsWidget> createState() => _SkillsWidgetState();
}

class _SkillsWidgetState extends State<SkillsWidget> {
  final HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback(
    //     (_) => controller.checkScrollWidgetIfNeedsScrolling(scrollController));
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.skillsNeedScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.checkSkillsIfNeedsScrolling();
      });
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'skills'.tr,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 25.h,
        ),
        SizedBox(
            height: 100.h,
            child: Stack(
              children: [
                Positioned.fill(
                    child: ListView.builder(
                  controller: controller.skillsScrollController,
                  padding: controller.skillsNeedScroll
                      ? EdgeInsets.symmetric(horizontal: 50.w)
                      : EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  itemCount: HomeData.homeData.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: MouseRegion(
                      onEnter: (_) {
                        controller.changeSkillsIconHover(true);
                        controller.skillsHoverId =
                            HomeData.homeData[index]['id'];
                      },
                      onExit: (_) {
                        controller.changeSkillsIconHover(false);
                        controller.skillsHoverId = 0;
                      },
                      child: Tooltip(
                        message: HomeData.homeData[index]['hint'],
                        child: GetBuilder<HomeController>(builder: (context) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOutBack,
                            height: HomeData.homeData[index]['id'] ==
                                    controller.skillsHoverId
                                ? controller.skillsIconHeight
                                : controller.skillsIconHeightNotHover,
                            width: HomeData.homeData[index]['id'] ==
                                    controller.skillsHoverId
                                ? controller.skillsIconHeight
                                : controller.skillsIconHeightNotHover,
                            child: SvgPicture.asset(
                                HomeData.homeData[index]['icon'],
                                colorFilter: const ColorFilter.mode(
                                    AppColors.whiteColor, BlendMode.srcIn)),
                          );
                        }),
                      ),
                    ),
                  ),
                )),
                if (controller.skillsNeedScroll)
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: IconButton(
                        onPressed: () {
                          controller.skillsScrollController.animateTo(
                            controller.skillsScrollController.offset + 250.w,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: CircleAvatar(
                          radius: Constants.isMobileScreen ? 45.r : 25.r,
                          backgroundColor: AppColors.blackWithOpicatyColor,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.whiteColor,
                            size: Constants.isMobileScreen ? 45.r : 25.r,
                          ),
                        )),
                  ),
                if (controller.skillsNeedScroll)
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(
                        onPressed: () {
                          controller.skillsScrollController.animateTo(
                            controller.skillsScrollController.offset - 250.w,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeInOut,
                          );
                        },
                        icon: CircleAvatar(
                          radius: Constants.isMobileScreen ? 45.r : 25.r,
                          backgroundColor: AppColors.blackWithOpicatyColor,
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.whiteColor,
                            size: Constants.isMobileScreen ? 45.r : 25.r,
                          ),
                        )),
                  ),
              ],
            )),
      ],
    );
  }
}

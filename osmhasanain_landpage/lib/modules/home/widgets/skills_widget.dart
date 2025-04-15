import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class SkillsWidget extends StatelessWidget {
  final HomeController controller = Get.find();
  SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: HomeData.homeData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: MouseRegion(
                  onEnter: (_) {
                    controller.changeSkillsIconHover(true);
                    controller.skillsHoverId = HomeData.homeData[index]['id'];
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
      ],
    );
  }
}

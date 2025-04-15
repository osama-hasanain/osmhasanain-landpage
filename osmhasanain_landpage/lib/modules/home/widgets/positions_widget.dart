import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class PositionsWidget extends StatelessWidget {
  final HomeController controller = Get.find();
  PositionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      padding: EdgeInsets.only(bottom: 50.h),
                      child: MouseRegion(
                        onEnter: (_) {
                          // if()
                          controller.changePositionsItemHover(true);
                          controller.positionsHoverId = item['id'];
                        },
                        onExit: (_) {
                          controller.changePositionsItemHover(false);
                          controller.positionsHoverId = 0;
                        },
                        child: GetBuilder<HomeController>(builder: (_) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TweenAnimationBuilder(
                                  tween: Tween<double>(
                                      begin: controller.isPositionsItemHover &&
                                              controller.positionsHoverId ==
                                                  item['id']
                                          ? Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.fontSize
                                          : Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.fontSize,
                                      end: controller.isPositionsItemHover &&
                                              controller.positionsHoverId ==
                                                  item['id']
                                          ? Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.fontSize
                                          : Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.fontSize),
                                  duration: const Duration(milliseconds: 300),
                                  builder: (context, value, child) {
                                    return Text(
                                      Get.locale?.languageCode == 'en'
                                          ? item['title_en']
                                          : item['title_ar'] ??
                                              item['title_en'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(fontSize: value),
                                    );
                                  }),
                              SizedBox(
                                height: 10.h,
                              ),
                              TweenAnimationBuilder(
                                  tween: Tween<double>(
                                      begin: controller.isPositionsItemHover &&
                                              controller.positionsHoverId ==
                                                  item['id']
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.fontSize
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize,
                                      end: controller.isPositionsItemHover &&
                                              controller.positionsHoverId ==
                                                  item['id']
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize
                                          : Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.fontSize),
                                  duration: const Duration(milliseconds: 300),
                                  builder: (context, value, child) {
                                    return Text(
                                      item['time'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.greyWhiteColor,
                                              fontSize: value),
                                    );
                                  }),
                              SizedBox(
                                height: 10.h,
                              ),
                              TweenAnimationBuilder(
                                  tween: Tween<double>(
                                      begin: controller.isPositionsItemHover &&
                                              controller.positionsHoverId ==
                                                  item['id']
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.fontSize
                                          : Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize,
                                      end: controller.isPositionsItemHover &&
                                              controller.positionsHoverId ==
                                                  item['id']
                                          ? Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.fontSize
                                          : Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.fontSize),
                                  duration: const Duration(milliseconds: 300),
                                  builder: (context, value, child) {
                                    return Text(
                                      Get.locale?.languageCode == 'en'
                                          ? item['desc_en']
                                          : item['desc_ar'] ?? item['desc_en'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.greyWhiteColor,
                                              fontSize: value),
                                    );
                                  }),
                            ],
                          );
                        }),
                      ),
                    ))
                .toList()),
      ],
    );
  }
}

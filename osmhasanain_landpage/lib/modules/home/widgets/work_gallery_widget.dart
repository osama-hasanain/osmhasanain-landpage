import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkGalleryWidget extends StatelessWidget {
  final HomeController controller = Get.find();
  WorkGalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'work_gallery'.tr,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'work_gallery_desc'.tr,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(
          height: 25.h,
        ),
        GetBuilder<HomeController>(builder: (_) {
          return Column(
              children: HomeData.worksGalleryItems
                  .map((item) => GestureDetector(
                        onTap: () {
                          if (item['url'] != null) {
                            canLaunchUrl(Uri.parse(item['url'])).then((value) {
                              if (value) {
                                launchUrl(Uri.parse(item['url']));
                              }
                            });
                          }
                        },
                        child: MouseRegion(
                          onEnter: (_) {
                            controller.changeWorkGalleryItemHover(true);
                            controller.workGalleryHoverId = item['id'];
                          },
                          onExit: (_) {
                            controller.changeWorkGalleryItemHover(false);
                            controller.workGalleryHoverId = 0;
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 50.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: controller.isWorkGalleryItemHover &&
                                          controller.workGalleryHoverId ==
                                              item['id']
                                      ? 100.w
                                      : 80.w,
                                  height: controller.isWorkGalleryItemHover &&
                                          controller.workGalleryHoverId ==
                                              item['id']
                                      ? 100.h
                                      : 80.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(item['img']),
                                          fit: BoxFit.cover),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TweenAnimationBuilder(
                                          tween: Tween<double>(
                                              begin: controller
                                                          .isWorkGalleryItemHover &&
                                                      controller
                                                              .workGalleryHoverId ==
                                                          item['id']
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .labelSmall
                                                      ?.fontSize
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .labelMedium
                                                      ?.fontSize,
                                              end: controller
                                                          .isWorkGalleryItemHover &&
                                                      controller
                                                              .workGalleryHoverId ==
                                                          item['id']
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .labelMedium
                                                      ?.fontSize
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .labelSmall
                                                      ?.fontSize),
                                          duration:
                                              const Duration(milliseconds: 300),
                                          builder: (context, value, child) {
                                            return Text(
                                              item['title'],
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
                                              begin: controller
                                                          .isWorkGalleryItemHover &&
                                                      controller
                                                              .workGalleryHoverId ==
                                                          item['id']
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.fontSize
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                              end: controller
                                                          .isWorkGalleryItemHover &&
                                                      controller
                                                              .workGalleryHoverId ==
                                                          item['id']
                                                  ? Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.fontSize),
                                          duration:
                                              const Duration(milliseconds: 300),
                                          builder: (context, value, child) {
                                            return Text(
                                              Get.locale?.languageCode == 'en'
                                                  ? item['desc_en']
                                                  : item['desc_ar'] +
                                                          item['desc_ar'] ??
                                                      item['desc_en'],
                                              maxLines: controller
                                                          .isWorkGalleryItemHover &&
                                                      controller
                                                              .workGalleryHoverId ==
                                                          item['id']
                                                  ? null
                                                  : 2,
                                              overflow: controller
                                                          .isWorkGalleryItemHover &&
                                                      controller
                                                              .workGalleryHoverId ==
                                                          item['id']
                                                  ? null
                                                  : TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(fontSize: value),
                                            );
                                          }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList());
        }),
      ],
    );
  }
}

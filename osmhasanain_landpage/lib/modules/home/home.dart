import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/modules/home/widgets/menu_widget.dart';
import 'package:osmhasanain_landpage/shared/resources/home_data.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class MyHomePage extends StatelessWidget {
  final HomeController controller = Get.find();
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuHomeWidget(onListItemTap: (index) {
              if (!controller.animateRun) {
                controller.onMenuItemTap(index);
                controller.animateScrollToIndex(index);
              }
            }),
            Expanded(
                flex: 4,
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
                          height: 130.h,
                        ),
                        Text(
                          HomeData.jobTitle,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          HomeData.shortDesc,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Text(
                          'Skills',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        SizedBox(
                            height: 70.h,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: HomeData.homeData.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Tooltip(
                                  message: HomeData.homeData[index]['hint'],
                                  child: SvgPicture.asset(
                                      HomeData.homeData[index]['icon'],
                                      height: 70.h,
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.whiteColor,
                                          BlendMode.srcIn)),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 100.h,
                        ),
                        Text(
                          'Work Gallery',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Column(
                            children: HomeData.worksGalleryItems
                                .map((item) => Padding(
                                      padding: EdgeInsets.only(bottom: 50.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 80.w,
                                            height: 80.h,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        AssetImage(item['img']),
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
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  item['title'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Text(
                                                  item['desc'],
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
                )),
          ],
        ),
      ),
    );
  }
}

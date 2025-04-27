import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';
import 'package:osmhasanain_landpage/shared/components/contacts_choices_widget.dart';
import 'package:osmhasanain_landpage/shared/resources/assets_managers.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class MenuHomeWidget extends StatelessWidget {
  MenuHomeWidget({super.key, required this.onListItemTap});
  final dynamic Function(int index) onListItemTap;

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          width: Constants.isMobileScreen ? 0 : 300.w,
          decoration: const BoxDecoration(
            color: AppColors.drawerColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetBuilder<HomeController>(builder: (context) {
                          return MouseRegion(
                            onEnter: (_) {
                              controller.changeDeveloperImageHover(true);
                            },
                            onExit: (_) {
                              controller.changeDeveloperImageHover(false);
                            },
                            child: Stack(children: [
                              TweenAnimationBuilder(
                                  tween: Tween<double>(
                                    begin: controller.isDeveloperImageHover
                                        ? 1
                                        : 0,
                                    end: controller.isDeveloperImageHover
                                        ? 0
                                        : 1,
                                  ),
                                  duration: Duration(
                                      seconds: controller
                                              .isDeveloperImageHoverFirstTime
                                          ? 5
                                          : 1),
                                  builder: (context, value, child) {
                                    return Center(
                                      child: Opacity(
                                        opacity: value,
                                        child: Image.asset(
                                          (Get.locale?.languageCode ?? 'en') ==
                                                  'en'
                                              ? IconsManager
                                                  .osmhasanainLeftToRightImage
                                              : IconsManager
                                                  .osmhasanainRightToLeftImage,
                                          height: 400.h,
                                          width: Constants.isMobileScreen
                                              ? 700.w
                                              : 300.w,
                                        ),
                                      ),
                                    );
                                  }),
                              TweenAnimationBuilder(
                                  tween: Tween<double>(
                                    begin: controller.isDeveloperImageHover
                                        ? 0
                                        : 1,
                                    end: controller.isDeveloperImageHover
                                        ? 1
                                        : 0,
                                  ),
                                  duration: Duration(
                                      seconds: controller
                                              .isDeveloperImageHoverFirstTime
                                          ? 5
                                          : 1),
                                  builder: (context, value, child) {
                                    return Center(
                                      child: Opacity(
                                        opacity: value,
                                        child: Image.asset(
                                          (Get.locale?.languageCode ?? 'en') ==
                                                  'en'
                                              ? IconsManager
                                                  .osmhasanainLeftToRightImageFill
                                              : IconsManager
                                                  .osmhasanainRightToLeftImageFill,
                                          height: 400.h,
                                          width: Constants.isMobileScreen
                                              ? 700.w
                                              : 300.w,
                                        ),
                                      ),
                                    );
                                  })
                            ]),
                          );
                        }),
                        listItem('home'.tr, IconsManager.iconHome,
                            controller.menuIndex.value == 0, 0),
                        listItem('skills'.tr, IconsManager.iconSkills,
                            controller.menuIndex.value == 1, 1),
                        listItem('positions'.tr, IconsManager.iconThumbtack,
                            controller.menuIndex.value == 2, 2),
                        listItem(
                            'work_gallery'.tr,
                            IconsManager.iconWorkGallery,
                            controller.menuIndex.value == 3,
                            3),
                        if (controller.blogsList.isNotEmpty)
                          listItem('blogs'.tr, IconsManager.iconBlog,
                              controller.menuIndex.value == 4, 4),
                      ]),
                ),
                if (!Constants.isMobileScreen) ContactsChoicesWidget()
              ],
            ),
          )),
    );
  }

  listItem(String title, String icon, bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        onListItemTap(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.yellowColor : null,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                icon,
                height: Constants.isMobileScreen ? 40.r : 20.r,
                width: Constants.isMobileScreen ? 40.r : 20.r,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    isSelected ? AppColors.blackColor : AppColors.whiteColor,
                    BlendMode.srcIn),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  color:
                      isSelected ? AppColors.blackColor : AppColors.whiteColor,
                  fontSize: Constants.isMobileScreen ? 40.sp : 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

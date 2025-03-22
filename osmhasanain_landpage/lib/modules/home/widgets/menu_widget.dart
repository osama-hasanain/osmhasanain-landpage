import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/resources/assets_managers.dart';
import 'package:osmhasanain_landpage/shared/resources/menu_data.dart';
import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class MenuHomeWidget extends StatelessWidget {
  MenuHomeWidget({super.key, required this.onListItemTap});
  final dynamic Function(int index) onListItemTap;
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
          flex: 1,
          child: Container(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          listItem('Home', IconsManager.iconHome,
                              controller.menuIndex.value == 0, 0),
                          listItem('Skills', IconsManager.iconSkills,
                              controller.menuIndex.value == 1, 1),
                          listItem('Work Gallery', IconsManager.iconList,
                              controller.menuIndex.value == 2, 2),
                          // const Spacer(),
                        ]),
                  ),
                  SizedBox(
                    height: 70.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: MenuData.socialMediaItems
                          .map((item) => InkWell(
                                onTap: () {
                                  controller.lunchToLink(item['link']);
                                },
                                child: Tooltip(
                                  message: item['title'],
                                  child: SvgPicture.asset(
                                    item['icon'],
                                    height: 25.h,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
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
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

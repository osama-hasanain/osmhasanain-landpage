import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';
import 'package:osmhasanain_landpage/shared/resources/menu_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsChoicesWidget extends StatelessWidget {
  ContactsChoicesWidget({super.key});
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.r,
      child: Row(
        mainAxisAlignment: Constants.isMobileScreen
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.spaceAround,
        children: MenuData.socialMediaItems
            .map((item) => MouseRegion(
                  onEnter: (_) {
                    controller.changeSocialIconHover(true);
                    controller.socialHoverId = item['id'];
                  },
                  onExit: (_) {
                    controller.changeSocialIconHover(false);
                    controller.socialHoverId = 0;
                  },
                  child: GestureDetector(
                    onTap: () async {
                      if (item['isGmail']) {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: item['link'],
                        );

                        if (await canLaunchUrl(emailUri)) {
                          await launchUrl(emailUri);
                        } else {
                          print('Could not launch email app');
                        }
                      } else {
                        controller.lunchToLink(item['link']);
                      }
                    },
                    child: Tooltip(
                      message: item['title'],
                      child: GetBuilder<HomeController>(builder: (context) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOutBack,
                          height: item['id'] == controller.socialHoverId
                              ? controller.socialIconHeight
                              : controller.socialIconHeightNotHover,
                          width: item['id'] == controller.socialHoverId
                              ? controller.socialIconHeight
                              : controller.socialIconHeightNotHover,
                          child: SvgPicture.asset(
                            item['icon'],
                          ),
                        );
                      }),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

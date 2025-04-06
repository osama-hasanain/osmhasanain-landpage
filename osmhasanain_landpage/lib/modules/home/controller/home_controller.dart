import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    super.onInit();
  }

  var menuIndex = 0.obs;

  void onMenuItemTap(int index) {
    menuIndex.value = index;
  }

  final ScrollController scrollController = ScrollController();

  void _onScroll() {
    if (!animateRun) {
      if (scrollController.position.pixels <= 20) {
        onMenuItemTap(0);
      } else if (scrollController.position.pixels <= 120 &&
          scrollController.position.pixels > 20) {
        onMenuItemTap(1);
      } else if (scrollController.position.pixels <= 220 &&
          scrollController.position.pixels > 20 &&
          scrollController.position.pixels > 120) {
        onMenuItemTap(2);
      }
    }
  }

  bool animateRun = false;
  void animateScrollToIndex(int index) {
    animateRun = true;
    scrollController
        .animateTo(
          index == 0
              ? 20
              : index == 1
                  ? 120
                  : 220,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        )
        .then((value) => animateRun = false);
  }

  void lunchToLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  late int socialHoverId = 0;
  late bool isSocialIconHover = false;
  changeSocialIconHover(bool value) {
    isSocialIconHover = value;
    setSocialIconHeight();
  }

  late double socialIconHeightHover = 40.h;
  late double socialIconHeightNotHover = 25.h;
  late double socialIconHeight = 25.h;

  setSocialIconHeight() {
    if (isSocialIconHover) {
      socialIconHeight = socialIconHeightHover;
    } else {
      socialIconHeight = socialIconHeightNotHover;
    }
    update();
  }

  late int skillsHoverId = 0;
  late bool isSkillsIconHover = false;
  changeSkillsIconHover(bool value) {
    isSkillsIconHover = value;
    setSkillsIconHeight();
  }

  late double skillsIconHeightHover = 100.h;
  late double skillsIconHeightNotHover = 70.h;
  late double skillsIconHeight = 70.h;

  setSkillsIconHeight() {
    if (isSkillsIconHover) {
      skillsIconHeight = skillsIconHeightHover;
    } else {
      skillsIconHeight = skillsIconHeightNotHover;
    }
    update();
  }

  late AnimationController menuAnimationController;
  late Animation<double> menuAnimation;
  late AnimationController homeAnimationController;
  late Animation<double> homeAnimation;

  initAnimationController(TickerProvider vsync) {
    menuAnimationController = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 800));
    menuAnimation = Tween<double>(begin: -300.w, end: 0).animate(
        CurvedAnimation(
            parent: menuAnimationController, curve: Curves.easeOutBack));

    homeAnimationController = AnimationController(
        vsync: vsync, duration: const Duration(milliseconds: 600));
    homeAnimation = Tween<double>(begin: 1000.h, end: 0).animate(
        CurvedAnimation(
            parent: homeAnimationController, curve: Curves.easeOutBack));

    menuAnimationController.forward();
    menuAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        homeAnimationController.forward();
      }
    });
  }
}

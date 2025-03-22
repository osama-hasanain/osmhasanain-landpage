import 'package:flutter/material.dart';
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
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';
import 'dart:async';

import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class BlogsWidget extends StatefulWidget {
  const BlogsWidget({super.key});

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  final HomeController controller = Get.find();
  bool _isScrollingToLast = false;
  bool _isUserRegionListItem = false;
  String? blogRegionId;

  @override
  void initState() {
    _startAutoScroll();
    super.initState();
  }

  void _startAutoScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer.periodic(const Duration(seconds: 2), (timer) {
        if (controller.blogsScrollController.offset >=
            controller.blogsScrollController.position.maxScrollExtent) {
          _isScrollingToLast = true;
        } else if (controller.blogsScrollController.offset <=
            controller.blogsScrollController.position.minScrollExtent) {
          _isScrollingToLast = false;
        }
        if (_isScrollingToLast &&
            !_isUserRegionListItem &&
            controller.blogsNeedScroll) {
          // var scrollValue = controller.blogsScrollController.position.maxScrollExtent -
          controller.blogsScrollController.offset;
          controller.blogsScrollController.animateTo(
            controller.blogsScrollController.offset - 500.h,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else if (!_isScrollingToLast &&
            !_isUserRegionListItem &&
            controller.blogsNeedScroll) {
          controller.blogsScrollController.animateTo(
            controller.blogsScrollController.offset + 500.h,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      if (controller.blogsList.isEmpty) {
        return const SizedBox();
      }
      if (!controller.blogsNeedScroll) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.checkBlogsIfNeedsScrolling();
        });
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'blogs'.tr,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          if (!Constants.isMobileScreen)
            SizedBox(
              height: 50.h,
            ),
          SizedBox(
              height: 500.h,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ListView.builder(
                      controller: controller.blogsScrollController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.blogsList.length,
                      itemBuilder: (context, index) {
                        var blog = controller.blogsList[index];
                        bool isHovered =
                            _isUserRegionListItem && blog.id == blogRegionId;

                        return MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              blogRegionId = blog.id;
                              _isUserRegionListItem = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              blogRegionId = null;
                              _isUserRegionListItem = false;
                            });
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 400.h,
                                width: 400.h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (_) {
                                      return SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 20.w,
                                            right: 15.w,
                                            left: 15.w,
                                          ),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topEnd,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Icon(
                                                        Icons.close,
                                                        size: 25.sp,
                                                      ),
                                                      color:
                                                          AppColors.whiteColor,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .center,
                                                    child: Container(
                                                      height: 500.h,
                                                      width: 500.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              blog.img!),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                blog.title!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                blog.content!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  height: isHovered ? 500.h : 400.h,
                                  width: isHovered ? 500.h : 400.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    image: DecorationImage(
                                      image: NetworkImage(blog.img!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  if (controller.blogsNeedScroll)
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: IconButton(
                          onPressed: () {
                            controller.blogsScrollController.animateTo(
                              controller.blogsScrollController.offset - 500.h,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                            _isScrollingToLast = true;
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
                  if (controller.blogsNeedScroll)
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: IconButton(
                          onPressed: () {
                            controller.blogsScrollController.animateTo(
                              controller.blogsScrollController.offset + 500.h,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                            _isScrollingToLast = false;
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
                ],
              ))
        ],
      );
    });
  }

  @override
  void dispose() {
    controller.blogsScrollController.dispose();
    super.dispose();
  }
}

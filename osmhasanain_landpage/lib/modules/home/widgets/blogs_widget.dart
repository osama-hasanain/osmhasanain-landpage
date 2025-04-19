import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/modules/home/controller/home_controller.dart';
import 'dart:async';

import 'package:osmhasanain_landpage/shared/styles/colors.dart';

class BlogsWidget extends StatefulWidget {
  const BlogsWidget({super.key});

  @override
  State<BlogsWidget> createState() => _BlogsWidgetState();
}

class _BlogsWidgetState extends State<BlogsWidget> {
  final HomeController controller = Get.find();

  final ScrollController _scrollController = ScrollController();
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
        if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
          _isScrollingToLast = true;
        } else if (_scrollController.offset <=
            _scrollController.position.minScrollExtent) {
          _isScrollingToLast = false;
        }
        if (_isScrollingToLast && !_isUserRegionListItem) {
          // var scrollValue = _scrollController.position.maxScrollExtent -
          _scrollController.offset;
          _scrollController.animateTo(
            _scrollController.offset - 500.h,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else if (!_isScrollingToLast && !_isUserRegionListItem) {
          _scrollController.animateTo(
            _scrollController.offset + 500.h,
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'blogs'.tr,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 50.h,
          ),
          SizedBox(
            height: 500.h,
            child: ListView.builder(
              controller: _scrollController,
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
                                                AlignmentDirectional.topEnd,
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                size: 25.sp,
                                              ),
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Container(
                                              height: 500.h,
                                              width: 500.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                image: DecorationImage(
                                                  image:
                                                      NetworkImage(blog.img!),
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
                          duration: Duration(milliseconds: 200),
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
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
          )
        ],
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

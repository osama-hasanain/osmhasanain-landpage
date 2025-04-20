import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:osmhasanain_landpage/shared/components/contacts_choices_widget.dart';
import 'package:osmhasanain_landpage/shared/components/constants.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'contact_me'.tr,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(height: Constants.isMobileScreen ? 10.h : 20.h),
        Text(
          Constants.isMobileScreen
              ? 'contact_me_desc_mobile'.tr
              : 'contact_me_desc'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SizedBox(height: 20.h),
        if (Constants.isMobileScreen) ContactsChoicesWidget()
      ],
    );
  }
}

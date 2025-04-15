import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        const SizedBox(height: 20),
        Text(
          'contact_me_desc'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

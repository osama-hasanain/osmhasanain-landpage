import 'dart:ui';

import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // Supported locales
  static final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('ar', 'EG'),
  ];

  // Translations map
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'tab_title': 'Osama Hasanain - Applications Developer',
          'job_title': 'Mobile Apps Developer Expert',
          'short_desc':
              'Passionate mobile developer crafting high-performance, user-friendly apps for iOS and Android. Expertise in Flutter and native development to bring ideas to life with seamless experiences 🚀',
          'home': 'Home',
          'skills': 'Skills',
          'positions': 'Positions',
          'work_gallery': 'Work Gallery',
          'work_gallery_desc':
              'This is examples for projects I worked about it',
          'contact_me': 'Contact Me',
          'contact_me_desc':
              'If you have any work, questions or inquiries, feel free to reach out to us within contacts links in side menu.',
          'change_language': 'change language to Arabic',
          'grade_you_visit': 'Glad you visited 😄',
          'blogs': 'Blogs',
        },
        'ar_EG': {
          'tab_title': 'أسامة حسنين - خبير تطوير تطبيقات',
          'job_title': 'خبير تطوير تطبيقات الموبايل',
          'short_desc':
              'مطور جوال شغوف، أصمم تطبيقات عالية الأداء وسهلة الاستخدام لنظامي الايفون و الاندرويد . خبرة في Flutter والتطوير الأصلي لتجسيد أفكارك بتجارب سلسة 🚀',
          'home': 'الرئيسية',
          'skills': 'المهارات',
          'positions': 'مراكز عمل',
          'work_gallery': 'معرض الأعمال',
          'work_gallery_desc': 'هذه أمثلة لمشاريع قمت بالعمل عليها',
          'contact_me': 'تواصل معي',
          'contact_me_desc':
              'إذا كان لديك أي عمل أو أسئلة أو استفسارات، فلا تتردد في التواصل معنا عبر جهات الاتصال في قائمة التنقل الجانبية.',
          'change_language': 'تغيير اللغة إلى الإنجليزية',
          'grade_you_visit': 'سعيد بزيارتك 😄',
          'blogs': 'المقالات',
        },
      };

  // Change Language
  static void changeLocale(String langCode, String countryCode) {
    Get.updateLocale(Locale(langCode, countryCode));
  }
}

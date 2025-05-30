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
          'job_title': 'Applications Developer Expert',
          'short_desc':
              'Hi, I\'m Osama M. Hasanain — a cross-platform app developer specialized in Flutter. I build modern, high-performance applications for Android, iOS, Windows, macOS, and the web — all from a single codebase. With experience leading development teams on multiple projects, I focus on clean UI, smooth performance, and scalable architecture. I turn ideas into powerful, real-world applications that deliver results.',
          'home': 'Home',
          'skills': 'Skills',
          'positions': 'Positions',
          'work_gallery': 'Work Gallery',
          'work_gallery_desc':
              'This is examples for projects I worked about it',
          'contact_me': 'Contact Me',
          'contact_me_desc':
              'Whether it’s a work, a collaboration, or just tech talk you can contact me within contacts links in side menu.',
          'contact_me_desc_mobile':
              'Whether it’s a work, a collaboration, or just tech talk you can contact me..',
          'change_language': 'View in Arabic',
          'grade_you_visit': 'Glad you visited 😄',
          'blogs': 'Blogs',
        },
        'ar_EG': {
          'tab_title': 'أسامة حسنين - خبير تطوير تطبيقات',
          'job_title': 'خبير تطوير تطبيقات',
          'short_desc':
              'مرحباً، أنا أسامة حسنين — مطور تطبيقات متعددة المنصات باستخدام Flutter. أقوم ببناء تطبيقات حديثة وعالية الأداء لأنظمة Android وiOS وWindows وmacOS والويب من خلال كود واحد فقط. لدي خبرة في قيادة فرق التطوير في عدة مشاريع، مع تركيزي على تصميم واجهات نظيفة، وأداء سلس، وبنية قوية وقابلة للتوسع. أحوّل الأفكار إلى تطبيقات عملية وقوية تقدم نتائج حقيقية.',
          'home': 'الرئيسية',
          'skills': 'المهارات',
          'positions': 'مراكز عمل',
          'work_gallery': 'معرض الأعمال',
          'work_gallery_desc': 'هذه أمثلة لمشاريع قمت بالعمل عليها',
          'contact_me': 'تواصل معي',
          'contact_me_desc':
              'سواء كان عملاً، تعاونًا، أو حتى حديثًا تقنيًا — يسعدني التواصل عبر جهات الاتصال في قائمة التنقل الجانبية.',
          'contact_me_desc_mobile':
              'سواء كان عملاً، تعاونًا، أو حتى حديثًا تقنيًا — يسعدني التواصل.',
          'change_language': 'عرض بالإنجليزية',
          'grade_you_visit': 'سعيد بزيارتك 😄',
          'blogs': 'المقالات',
        },
      };

  // Change Language
  static void changeLocale(String langCode, String countryCode) {
    Get.updateLocale(Locale(langCode, countryCode));
  }
}

// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ne_NP = {
  "favouriteMovies": "मनपर्ने चलचित्रहरू",
  "language": "भाषा",
  "feedback": "प्रतिक्रिया",
  "about": "हाम्रो बारेमा",
  "popular": "लोकप्रिय",
  "now": "हालमा प्रदर्शन",
  "trending": "ट्रेन्डिङ",
  "english": "अंग्रेजी",
  "nepali": "नेपाली"
};
static const Map<String,dynamic> en_US = {
  "favouriteMovies": "Favourite Movies",
  "language": "Languages",
  "feedback": "Feedback",
  "about": "About",
  "popular": "Popular",
  "now": "Now",
  "trending": "Trending",
  "english": "English",
  "nepali": "Nepali"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ne_NP": ne_NP, "en_US": en_US};
}

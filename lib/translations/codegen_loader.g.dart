// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
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
  "nepali": "नेपाली",
  "cast": "अभिनेताहरू",
  "trailers": "ट्रेलरहरू",
  "watch_trailers": "ट्रेलरहरू हेर्नुहोस्",
  "no_movies_found": "कुनै चलचित्र फेला परेन",
  "no_favourite_movies": "कुनै पनि मनपर्ने चलचित्र फेला परेन",
  "favourite_movies": "मनपर्ने चलचित्रहरू"
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
  "nepali": "Nepali",
  "cast": "Cast",
  "trailers": "Trailers",
  "watch_trailers": "Watch Trailers",
  "no_movies_found": "No Movies Found",
  "no_favourite_movies": "No Favourite Movies Found",
  "favourite_movies": "Favourite Movies"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ne_NP": ne_NP, "en_US": en_US};
}

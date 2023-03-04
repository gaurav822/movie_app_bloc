import 'package:movie_app_bloc/domain/entities/language_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movie_app_bloc/translations/locale_keys.g.dart';

class Language {
  const Language._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English'),
    LanguageEntity(code: 'ne', value: 'Nepali')
  ];

}
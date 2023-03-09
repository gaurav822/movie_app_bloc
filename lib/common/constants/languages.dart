import 'package:movie_app_bloc/domain/entities/language_entity.dart';

class Language {
  const Language._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'English',countryCode: 'US'),
    LanguageEntity(code: 'ne', value: 'Nepali',countryCode: 'NP')
  ];

}
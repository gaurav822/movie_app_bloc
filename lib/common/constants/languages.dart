import 'package:movie_app_bloc/domain/entities/language_entity.dart';

class Language {
  const Language._();

  static const languages = [
    LanguageEntity(code: 'en', value: 'english',countryCode: 'US'),
    LanguageEntity(code: 'ne', value: 'nepali',countryCode: 'NP')
  ];

}
part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LanguageToggleEvent extends LanguageEvent{
  final Locale locale;

  const LanguageToggleEvent(this.locale);

  @override
  List<Object?> get props => [locale.countryCode];
}

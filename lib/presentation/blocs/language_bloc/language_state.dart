part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();
}

class LanguageInitial extends LanguageState {
  @override
  List<Object> get props => [];
}

class LanguageLoadedState extends LanguageState{
  final Locale locale;

  const LanguageLoadedState(this.locale);

  @override
  List<Object?> get props => [locale.languageCode];
}

import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/common/constants/languages.dart';
import 'package:movie_app_bloc/domain/entities/language_entity.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoadedState(Locale(Language.languages[0].code))) {
    on<LanguageEvent>((event, emit) {
      if(event is LanguageToggleEvent){
        emit(LanguageLoadedState(event.locale));
      }
    });
  }

  void changeLocale(Locale locale){
    add(LanguageToggleEvent(locale));
  }
}

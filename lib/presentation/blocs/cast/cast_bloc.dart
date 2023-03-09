import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/cast_entity.dart';
import '../../../domain/entities/movie_params.dart';
import '../../../domain/usecases/get_cast.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCast;
  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<CastEvent>((event, emit) async{
      if(event is LoadCastEvent){
        final castAndCrew = await getCast(MovieParams(id: event.movieId));
        emit(CastLoaded(casts: castAndCrew!));
      }
    });
  }
}

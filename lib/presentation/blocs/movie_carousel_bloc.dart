import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/usecases/get_trending.dart';

import '../../domain/entities/movie_entity.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {

  final GetTrending getTrending;

  MovieCarouselBloc(
  {
    required this.getTrending
}
      ) : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async{

      if(event is CarouselLoadEvent){
        final movies = await getTrending(NoParams());
        emit(MovieCarouselLoaded(
          movies: movies!,
          defaultIndex: event.defaultIndex
        ));
      }

    });
  }
}

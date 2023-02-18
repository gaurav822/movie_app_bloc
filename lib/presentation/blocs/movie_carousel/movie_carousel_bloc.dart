import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/usecases/get_trending.dart';

import '../../../domain/entities/movie_entity.dart';
import '../movie_backdrop/movie_backdrop_bloc.dart';
import 'movie_carousel_state.dart';

part 'movie_carousel_event.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {

  final GetTrending getTrending;
  final MovieBackdropBloc movieBackDropBloc;

  MovieCarouselBloc(
  {
    required this.getTrending,
    required this.movieBackDropBloc
}
      ) : super(MovieCarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async{

      if(event is CarouselLoadEvent){
        final movies = await getTrending(NoParams());
        movieBackDropBloc.add(MovieBackDropChangeEvent(movies![event.defaultIndex]));
        emit(MovieCarouselLoaded(
          movies: movies!,
          defaultIndex: event.defaultIndex
        ));
      }

    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/usecases/get_trending.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetTrending getTrending;
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;

  MovieTabbedBloc({required this.getTrending, required this.getPopular, required this.getPlayingNow}) : super(const MovieTabbedInitial(currentTabIndex: 0)) {
    on<MovieTabbedEvent>((event, emit) async{
      if(event is MovieTabChangedEvent){
        List<MovieEntity>? movies;
        switch(event.currentTabIndex){
          case 0:
            movies = await getPopular(NoParams());
            break;
          case 1:
            movies = await getPlayingNow(NoParams());
            break;
          case 2:
            movies = await getTrending(NoParams());
            break;
        }
        emit(MovieTabbedChanged(currentTabIndex: state.currentTabIndex, movies: movies!));
      }
    });
  }
}

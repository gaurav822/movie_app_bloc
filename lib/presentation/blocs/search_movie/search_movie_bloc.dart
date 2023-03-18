import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_bloc/data/models/movie.dart';
import 'package:movie_app_bloc/domain/entities/movie_search_params.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_search_movies.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final GetSearchMovies getSearchMovies;
  SearchMovieBloc({required this.getSearchMovies}) : super(SearchMovieInitial()) {
    on<SearchMovieEvent>((event, emit) async{
      if(event is SearchTermChangedEvent) {
        if(event.searchTerm.length>2){
          emit(SearchMovieLoading());
          final movies = await getSearchMovies(MovieSearchParams(searchTerm: event.searchTerm));
          emit(SearchMovieLoaded(movies!));
        }
      }
    });
  }
}

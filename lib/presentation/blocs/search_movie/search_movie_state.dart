part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieState {}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {

  final List<MovieEntity> movies;
  SearchMovieLoaded(this.movies);
}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieError extends SearchMovieState {}


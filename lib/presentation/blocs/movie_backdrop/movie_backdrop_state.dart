part of 'movie_backdrop_bloc.dart';

@immutable
abstract class MovieBackdropState {}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackdropChanged extends MovieBackdropState {
  final MovieEntity movie;
  MovieBackdropChanged(this.movie);
}

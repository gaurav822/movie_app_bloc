part of 'movie_backdrop_bloc.dart';

@immutable
abstract class MovieBackdropEvent {}

class MovieBackDropChangeEvent extends MovieBackdropEvent{
  final MovieEntity movie;
  MovieBackDropChangeEvent(this.movie);
}

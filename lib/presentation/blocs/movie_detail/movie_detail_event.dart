part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {
  const MovieDetailEvent();
}

class MovieDetailLoadEvent extends MovieDetailEvent {
  final int movieId;
  const MovieDetailLoadEvent(this.movieId);
}

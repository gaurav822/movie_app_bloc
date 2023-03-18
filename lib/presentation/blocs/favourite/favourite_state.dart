part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class FavouriteMoviesLoaded extends FavouriteState {
  final List<MovieEntity> movies;

  FavouriteMoviesLoaded(this.movies);
}

class FavouriteMovieError extends FavouriteState{}

class IsFavouriteMovie extends FavouriteState{
  final bool isMovieFavourite;
  IsFavouriteMovie(this.isMovieFavourite);
}



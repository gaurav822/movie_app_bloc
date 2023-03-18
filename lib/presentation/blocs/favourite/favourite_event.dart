part of 'favourite_bloc.dart';

@immutable
abstract class FavouriteEvent {}

class LoadFavouriteMovieEvent extends FavouriteEvent {

}

class DeleteFavouriteMovieEvent extends FavouriteEvent {
  final int movieId;
  DeleteFavouriteMovieEvent(this.movieId);
}

class ToggleFavouriteMovieEvent extends FavouriteEvent {
  final MovieEntity movieEntity;
  final bool isFavourite;

  ToggleFavouriteMovieEvent(this.movieEntity,this.isFavourite);

}

class CheckIfFavouriteMovieEvent extends FavouriteEvent {
  final int movieid;
  CheckIfFavouriteMovieEvent(this.movieid);
}

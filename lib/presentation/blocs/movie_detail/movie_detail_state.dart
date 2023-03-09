part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {

}
class MovieDetailLoading extends MovieDetailState {

}
class MovieDetailError extends MovieDetailState {

}
class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity movieDetailEntity;
  MovieDetailLoaded(this.movieDetailEntity);
}

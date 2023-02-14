part of 'movie_carousel_bloc.dart';

@immutable
abstract class MovieCarouselState {}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState{}

class MovieCarouselLoaded extends MovieCarouselState{
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselLoaded({required this.movies,this.defaultIndex=0});
}

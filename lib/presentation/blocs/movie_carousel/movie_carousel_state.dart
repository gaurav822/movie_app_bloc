
import 'package:flutter/cupertino.dart';
import '../../../domain/entities/movie_entity.dart';

@immutable
abstract class MovieCarouselState {}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselError extends MovieCarouselState{}

class MovieCarouselLoaded extends MovieCarouselState{
  final List<MovieEntity> movies;
  final int defaultIndex;

  MovieCarouselLoaded({required this.movies,this.defaultIndex=0});
}

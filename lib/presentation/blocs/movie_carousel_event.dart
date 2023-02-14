part of 'movie_carousel_bloc.dart';

abstract class MovieCarouselEvent {}

class CarouselLoadEvent extends MovieCarouselEvent{
  int defaultIndex;

  CarouselLoadEvent({this.defaultIndex=0});
}


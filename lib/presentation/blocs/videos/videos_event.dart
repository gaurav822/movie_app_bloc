part of 'videos_bloc.dart';

@immutable
abstract class VideosEvent {}

class LoadVideosEvent extends VideosEvent {
  int movieId;
  LoadVideosEvent({required this.movieId});
}

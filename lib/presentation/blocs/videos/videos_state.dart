part of 'videos_bloc.dart';

@immutable
abstract class VideosState {}

class VideosInitial extends VideosState {}

class NoVideos extends VideosState {}

class VideosLoaded extends VideosState {
  final List<VideoEntity> videos;

  VideosLoaded({required this.videos});
}

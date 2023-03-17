import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/movie_params.dart';
import '../../../domain/entities/video_entity.dart';
import '../../../domain/usecases/get_videos.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;
  VideosBloc({
    required this.getVideos
}) : super(VideosInitial()) {
    on<VideosEvent>((event, emit) async{
      if(event is LoadVideosEvent){
        final videos = await getVideos(MovieParams(id: event.movieId));
        if(videos!=null && videos.isNotEmpty){
          emit(VideosLoaded(videos: videos!));
        }
        else{
          emit(NoVideos());
        }
      }
    });
  }
}

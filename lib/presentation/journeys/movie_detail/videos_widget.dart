import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/watch_video/watch_video_arguments.dart';

import '../../widget/button.dart';
import '../watch_video/watch_video_screen.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;
  const VideosWidget({Key? key,required this.videosBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
        builder: (context,state){
            if(state is VideosLoaded && state.videos.iterator.moveNext()){
              final videos = state.videos;
              return Button(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WatchVideoScreen(watchVideoArguments: WatchVideoArguments(videos),)));
                  },
                  text: 'Watch Trailers',);
            }
            else{
              return const SizedBox.shrink();
            }
        });
  }
}

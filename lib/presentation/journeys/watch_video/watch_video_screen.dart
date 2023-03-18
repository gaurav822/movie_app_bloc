import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/domain/entities/video_entity.dart';
import 'package:movie_app_bloc/presentation/journeys/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;

  const WatchVideoScreen({Key? key,required this.watchVideoArguments}) : super(key: key);

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  late List<VideoEntity> _videos;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
        initialVideoId: _videos[0].key!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Watch Trailers"),
      ),
      body: YoutubePlayerBuilder(
        builder: (context,player){
          return Column(
            children: [
              player,
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=1;i< _videos.length;i++)
                      Container(
                        height: 140,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                _controller.load(_videos[i].key!);
                                _controller.play();
                              },
                              child:  Expanded(
                                child: CachedNetworkImage(
                                  height: 300,
                                    width: 200,
                                    imageUrl: YoutubePlayer.getThumbnail(videoId: _videos[i].key!,quality: ThumbnailQuality.high),
                                  ),
                              ),
                              ),


                            Expanded(child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(_videos[i].name!,style: TextStyle(color: Colors.white),),
                            ))
                          ],
                        ),
                      )
                  ],
                ),
              ))
            ],
          );
        },
        player: YoutubePlayer(controller: _controller,),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/common/extensions/string_extension.dart';
import 'package:movie_app_bloc/data/core/api_constants.dart';

import '../../movie_detail/movie_detail_arguments.dart';
import '../../movie_detail/movie_detail_screen.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title,posterPath;
  const MovieTabCardWidget({Key? key, required this.movieId, required this.title, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movieId))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.baseImageUrl}$posterPath',
              fit: BoxFit.cover,
            ),
          )),
          Padding(
              padding: const EdgeInsets.only(top: 4),
            child: Text(title.intelliTrim(),maxLines: 1,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18),),
          )
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/data/core/api_constants.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget({Key? key, required this.posterPath, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      child: GestureDetector(
        onTap: (){},
        child: ClipRect(
          child: CachedNetworkImage(imageUrl: '${ApiConstants.baseImageUrl}$posterPath',fit: BoxFit.cover,),
        ),
      ),
    );
  }
}

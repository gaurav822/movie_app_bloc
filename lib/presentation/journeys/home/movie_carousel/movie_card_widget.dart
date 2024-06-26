import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/data/core/api_constants.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/movie_detail_screen.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget({Key? key, required this.posterPath, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movieId))));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(imageUrl: '${ApiConstants.baseImageUrl}$posterPath',fit: BoxFit.cover,),
        ),

    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_bloc/data/core/api_constants.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/movie_detail_screen.dart';
import 'package:movie_app_bloc/presentation/themes/theme_text.dart';

import '../movie_detail/movie_detail_arguments.dart';

class SearchMovieCard extends StatelessWidget {
  final MovieEntity movie;
  const SearchMovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movie.id!))));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',
                  width: 80,
                ),
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  movie.title!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  movie.overview!,
                  style: Theme.of(context).textTheme.greyCaption,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

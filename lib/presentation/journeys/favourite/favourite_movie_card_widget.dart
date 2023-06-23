import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/movie_detail_screen.dart';

import '../../../data/core/api_constants.dart';

class FavouriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const FavouriteMovieCardWidget({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetailScreen(movieDetailArguments: MovieDetailArguments(movie.id!))));
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(imageUrl: '${ApiConstants.baseImageUrl}${movie.posterPath}',fit: BoxFit.cover,width: 200,)),

            Align(alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => BlocProvider.of<FavouriteBloc>(context).add(DeleteFavouriteMovieEvent(movie.id!)),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Icon(Icons.delete,size: 20,color: Colors.white,),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}

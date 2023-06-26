import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailAppBar({Key? key,required this.movieDetailEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30,)),
        BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            if(state is IsFavouriteMovie){
              return GestureDetector(
                onTap: (){
                  if(state.isMovieFavourite){
                    Fluttertoast.showToast(
                        msg: "Movie removed from favourite list",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Movie added to favourite list",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.greenAccent,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
                  }
                   BlocProvider.of<FavouriteBloc>(context).add(
                       ToggleFavouriteMovieEvent(
                           MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                           state.isMovieFavourite));
                },
                child: Icon(
                  state.isMovieFavourite?Icons.favorite:Icons.favorite_border, color: Colors.white, size: 30,
                ),
              );
            }
            else{
              return const Icon(
               Icons.favorite_border, color: Colors.white, size: 30,
              );
            }
          },
        )
      ],
    );
  }
}

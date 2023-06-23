import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';

import '../../../domain/usecases/check_if_favourite.dart';
import '../../../domain/usecases/delete_favourite_movie.dart';
import '../../../domain/usecases/get_favourite_movies.dart';
import '../../../domain/usecases/save_movie.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final SaveMovie saveMovie;
  final GetFavouriteMovies getFavouriteMovies;
  final DeleteFavouriteMovie deleleFavouriteMovie;
  final CheckIfFavouriteMovie checkIfFavouriteMovie;

  FavouriteBloc({required this.saveMovie,required this.getFavouriteMovies,required this.deleleFavouriteMovie,required this.checkIfFavouriteMovie}) : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) async{
        if(event is ToggleFavouriteMovieEvent){
          if(event.isFavourite){
            await deleleFavouriteMovie(MovieParams(id: event.movieEntity.id!));
          } 
          else{
            await saveMovie(event.movieEntity);
          }
          final response = await checkIfFavouriteMovie(MovieParams(id: event.movieEntity.id!));
          emit(IsFavouriteMovie(response));
        }

        else if(event is LoadFavouriteMovieEvent){
          final response = await getFavouriteMovies(NoParams());
          emit(FavouriteMoviesLoaded(response));
        }

        else if(event is DeleteFavouriteMovieEvent){
           await deleleFavouriteMovie(MovieParams(id: event.movieId));
           final response = await getFavouriteMovies(NoParams());
           emit(FavouriteMoviesLoaded(response));
        }

        else if(event is CheckIfFavouriteMovieEvent){
          final response = await checkIfFavouriteMovie(MovieParams(id: event.movieid));
          emit(IsFavouriteMovie(response));
        }
    });
  }
}

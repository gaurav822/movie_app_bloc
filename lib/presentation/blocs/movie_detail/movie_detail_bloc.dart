import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';

import '../../../domain/usecases/get_movie_details.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  MovieDetailBloc({required this.getMovieDetail}) : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) async{
      if(event is MovieDetailLoadEvent){
        final movie = await getMovieDetail(MovieParams(id: event.movieId));
        emit(MovieDetailLoaded(movie!));
      }
    });
  }
}

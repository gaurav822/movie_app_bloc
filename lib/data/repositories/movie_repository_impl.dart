import 'package:movie_app_bloc/common/network/api_result.dart';
import 'package:movie_app_bloc/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_bloc/data/models/movie.dart';
import 'package:movie_app_bloc/data/tables/movie_table.dart';
import 'package:movie_app_bloc/domain/entities/cast_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/video_entity.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

import '../data_source/movie_local_data_source.dart';

class MovieRepositoryImpl extends MovieRepository{

  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource movieLocalDataSource;

  MovieRepositoryImpl(this.remoteDataSource,this.movieLocalDataSource);

  @override
  Future<List<MovieEntity>?> getTrending() async{
    try{
      final movies = await remoteDataSource.getTrending();
      return movies;
    } on Exception{
      return null;
    }
  }

  @override
  Future<List<MovieEntity>?> getPlayingNow() async{
    try{
      final movies = await remoteDataSource.getPlayingNow();
      return movies;
    } on Exception{
      return null;
    }
  }

  @override
  Future<List<MovieEntity>?> getPopular() async{
    try{
      final movies = await remoteDataSource.getPopular();
      return movies;
    } on Exception{
      return null;
    }
  }

  @override
  Future<MovieDetailEntity?> getMovieDetail(int id) async{
    try{
      final movie = await remoteDataSource.getMovieDetail(id);
      return movie;
    } on Exception{
      return null;
    }
  }

  @override
  Future<List<CastEntity>?> getCastCrew(int id) async{
    try{
      final castCrew = await remoteDataSource.getCastCrew(id);
      return castCrew;
    } on Exception{
      return null;
    }
  }

  @override
  Future<List<VideoEntity>?> getVideos(int id) async{
    try{
      final videos = await remoteDataSource.getVideos(id);
      return videos;
    } on Exception{
      return null;
    }
  }

  @override
  Future<List<MovieEntity>?> getSearchedMovies(String searchTerm) async{
    try{
      final movie = await remoteDataSource.getSearchMovies(searchTerm);
      return movie;
    } on Exception{
      return null;
    }
  }

  @override
  Future<bool> checkIfMovieFavourite(int movieId) async{
    final response = await movieLocalDataSource.checkIfMovieFavourite(movieId);
    return response;
  }

  @override
  Future<void> deleteMovie(int movieId) async{
    final response = await movieLocalDataSource.deleteMovie(movieId);
    return response;
  }

  @override
  Future<List<MovieEntity>> getFavouriteMovies() async{
    final response = await movieLocalDataSource.getMovies();
    return response;
  }

  @override
  Future<void> saveMovie(MovieEntity movieEntity) async{
      final response = await movieLocalDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return response;
  }
}


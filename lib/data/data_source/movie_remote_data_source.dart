import 'package:movie_app_bloc/data/core/api_client.dart';
import 'package:movie_app_bloc/data/models/cast_model.dart';
import 'package:movie_app_bloc/data/models/cast_result_model.dart';
import 'package:movie_app_bloc/data/models/movie_detail_model.dart';
import 'package:movie_app_bloc/data/models/movie_result_model.dart';
import '../models/movie.dart';

abstract class MovieRemoteDataSource{
  Future<List<Movie>?> getTrending();
  Future<List<Movie>?> getPopular();
  Future<List<Movie>?> getPlayingNow();
  Future<MovieDetailModel?> getMovieDetail(int id);
  Future<List<CastModel>?> getCastCrew(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource{
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<Movie>?> getTrending() async{
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<Movie>?> getPlayingNow() async{
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<List<Movie>?> getPopular() async{
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).results;
    return movies;
  }

  @override
  Future<MovieDetailModel?> getMovieDetail(int id) async{
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    return movie;
  }

  @override
  Future<List<CastModel>?> getCastCrew(int id) async{
    final response = await _client.get('movie/$id/credits');
    final movie = CastResultModel.fromJson(response).cast;
    print(movie);
    return movie;
  }

}
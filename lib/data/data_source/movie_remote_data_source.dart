import 'package:movie_app_bloc/data/core/api_client.dart';
import 'package:movie_app_bloc/data/models/cast_model.dart';
import 'package:movie_app_bloc/data/models/cast_result_model.dart';
import 'package:movie_app_bloc/data/models/movie_detail_model.dart';
import 'package:movie_app_bloc/data/models/movie_result_model.dart';
import 'package:movie_app_bloc/data/models/video_result_model.dart';
import '../models/movie.dart';
import '../models/video_model.dart';

abstract class MovieRemoteDataSource{
  Future<List<Movie>?> getTrending();
  Future<List<Movie>?> getPopular();
  Future<List<Movie>?> getPlayingNow();
  Future<List<Movie>?> getSearchMovies(String searchTerm);
  Future<MovieDetailModel?> getMovieDetail(int id);
  Future<List<CastModel>?> getCastCrew(int id);
  Future<List<VideoModel>?> getVideos(int id);
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
    return movie;
  }

  @override
  Future<List<VideoModel>?> getVideos(int id) async{
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).results;
    return videos;
  }

  @override
  Future<List<Movie>?> getSearchMovies(String searchTerm) async{
    final response = await _client.get(
        'search/movie',
      params: {
          'query':searchTerm
      }
    );
    final movies = MoviesResultModel.fromJson(response).results;
    print(movies);
    return movies;
  }

}
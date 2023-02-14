import 'package:movie_app_bloc/data/core/api_client.dart';
import 'package:movie_app_bloc/data/models/movie_result_model.dart';
import '../models/movie.dart';

abstract class MovieRemoteDataSource{
  Future<List<Movie>?> getTrending();
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

}
import 'package:movie_app_bloc/common/network/api_result.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';

abstract class MovieRepository{
  Future<List<MovieEntity>?> getTrending();
}


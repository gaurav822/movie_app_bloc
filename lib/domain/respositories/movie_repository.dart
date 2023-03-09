import 'package:movie_app_bloc/common/network/api_result.dart';
import 'package:movie_app_bloc/domain/entities/cast_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';

import '../entities/movie_detail_entity.dart';

abstract class MovieRepository{
  Future<List<MovieEntity>?> getTrending();
  Future<List<MovieEntity>?> getPopular();
  Future<List<MovieEntity>?> getPlayingNow();
  Future<MovieDetailEntity?> getMovieDetail(int id);
  Future<List<CastEntity>?> getCastCrew(int id);
}


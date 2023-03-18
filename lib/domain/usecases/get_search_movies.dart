import 'package:movie_app_bloc/common/network/api_result.dart';
import 'package:movie_app_bloc/common/usecase/usecase.dart';
import 'package:movie_app_bloc/data/models/movie.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_search_params.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

class GetSearchMovies extends UseCase<List<MovieEntity>?,MovieSearchParams>{
  final MovieRepository repository;

  GetSearchMovies(this.repository);

  @override
  Future<List<MovieEntity>?> call(MovieSearchParams params) async {
    return await repository.getSearchedMovies(params.searchTerm);
  }

}
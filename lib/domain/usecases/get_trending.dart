import 'package:movie_app_bloc/common/network/api_result.dart';
import 'package:movie_app_bloc/common/usecase/usecase.dart';
import 'package:movie_app_bloc/data/models/movie.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

class GetTrending extends UseCase<List<MovieEntity>?,NoParams>{
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<List<MovieEntity>?> call(NoParams params) async {
    return await repository.getTrending();
  }

}
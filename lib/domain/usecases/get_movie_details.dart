
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';
import '../../common/usecase/usecase.dart';
import '../entities/no_params.dart';
import '../respositories/movie_repository.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity?,MovieParams>{
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<MovieDetailEntity?> call(MovieParams params) async{
    return await repository.getMovieDetail(params.id);
  }
}
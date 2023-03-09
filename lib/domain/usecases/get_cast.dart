
import 'package:movie_app_bloc/domain/entities/cast_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';
import '../../common/usecase/usecase.dart';
import '../entities/no_params.dart';
import '../respositories/movie_repository.dart';

class GetCast extends UseCase<List<CastEntity>?,MovieParams>{
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<List<CastEntity>?> call(MovieParams params) async{
    return await repository.getCastCrew(params.id);
  }
}
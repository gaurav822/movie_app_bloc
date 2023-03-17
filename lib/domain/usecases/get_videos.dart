
import 'package:movie_app_bloc/domain/entities/cast_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';
import 'package:movie_app_bloc/domain/entities/video_entity.dart';
import '../../common/usecase/usecase.dart';
import '../entities/no_params.dart';
import '../respositories/movie_repository.dart';

class GetVideos extends UseCase<List<VideoEntity>?,MovieParams>{
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<List<VideoEntity>?> call(MovieParams params) async{
    return await repository.getVideos(params.id);
  }
}
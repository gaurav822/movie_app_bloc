import 'package:movie_app_bloc/common/usecase/usecase.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

class DeleteFavouriteMovie extends UseCase<void,MovieParams>{
  final MovieRepository movieRepository;
  DeleteFavouriteMovie(this.movieRepository);

  @override
  Future<void> call(MovieParams params) async{
    return await movieRepository.deleteMovie(params.id);
  }

}
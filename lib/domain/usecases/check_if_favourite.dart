import 'package:movie_app_bloc/common/usecase/usecase.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/movie_params.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

class CheckIfFavouriteMovie extends UseCase<bool,MovieParams>{
  final MovieRepository movieRepository;
  CheckIfFavouriteMovie(this.movieRepository);

  @override
  Future<bool> call(MovieParams params) async{
    return await movieRepository.checkIfMovieFavourite(params.id);
  }

}
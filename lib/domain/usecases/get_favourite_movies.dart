import 'package:movie_app_bloc/common/usecase/usecase.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/entities/no_params.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

class GetFavouriteMovies extends UseCase<List<MovieEntity>,NoParams>{
  final MovieRepository movieRepository;
  GetFavouriteMovies(this.movieRepository);
  @override
  Future<List<MovieEntity>> call(NoParams params) async{
    return await movieRepository.getFavouriteMovies();
  }

}
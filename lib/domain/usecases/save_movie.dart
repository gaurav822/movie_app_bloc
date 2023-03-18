import 'package:movie_app_bloc/common/usecase/usecase.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';

class SaveMovie extends UseCase<void,MovieEntity>{
  final MovieRepository movieRepository;
  SaveMovie(this.movieRepository);
  @override
  Future<void> call(MovieEntity params) async{
    return await movieRepository.saveMovie(params);
  }
  
}
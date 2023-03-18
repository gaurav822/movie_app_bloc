import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_bloc/data/core/api_client.dart';
import 'package:movie_app_bloc/data/data_source/movie_local_data_source.dart';
import 'package:movie_app_bloc/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_bloc/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';
import 'package:movie_app_bloc/domain/usecases/check_if_favourite.dart';
import 'package:movie_app_bloc/domain/usecases/delete_favourite_movie.dart';
import 'package:movie_app_bloc/domain/usecases/get_cast.dart';
import 'package:movie_app_bloc/domain/usecases/get_favourite_movies.dart';
import 'package:movie_app_bloc/domain/usecases/get_movie_details.dart';
import 'package:movie_app_bloc/domain/usecases/get_playing_now.dart';
import 'package:movie_app_bloc/domain/usecases/get_popular.dart';
import 'package:movie_app_bloc/domain/usecases/get_search_movies.dart';
import 'package:movie_app_bloc/domain/usecases/get_trending.dart';
import 'package:movie_app_bloc/domain/usecases/get_videos.dart';
import 'package:movie_app_bloc/domain/usecases/save_movie.dart';
import 'package:movie_app_bloc/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/favourite/favourite_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/videos/videos_bloc.dart';

final getInstance = GetIt.instance;

Future init() async {
  getInstance.registerLazySingleton<Dio>(() => Dio());

  getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));

  getInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getInstance()));
  getInstance.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl());

  getInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getInstance(),getInstance()));

  getInstance.registerLazySingleton<GetTrending>(() => GetTrending(getInstance()));
  getInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getInstance()));
  getInstance.registerLazySingleton<GetCast>(() => GetCast(getInstance()));
  getInstance.registerLazySingleton<GetVideos>(() => GetVideos(getInstance()));
  getInstance.registerLazySingleton<GetSearchMovies>(() => GetSearchMovies(getInstance()));
  getInstance.registerLazySingleton<SaveMovie>(() => SaveMovie(getInstance()));
  getInstance.registerLazySingleton<GetFavouriteMovies>(() => GetFavouriteMovies(getInstance()));
  getInstance.registerLazySingleton<DeleteFavouriteMovie>(() => DeleteFavouriteMovie(getInstance()));
  getInstance.registerLazySingleton<CheckIfFavouriteMovie>(() => CheckIfFavouriteMovie(getInstance()));

  getInstance.registerFactory(() => MovieCarouselBloc(getTrending: getInstance(),movieBackDropBloc: getInstance()));
  
  getInstance.registerFactory(() => MovieBackdropBloc());

  getInstance.registerFactory(() => MovieTabbedBloc(
      getTrending: GetTrending(getInstance()),
      getPopular: GetPopular(getInstance()),
      getPlayingNow: GetPlayingNow(getInstance())));
  
  getInstance.registerFactory(() => MovieDetailBloc(getMovieDetail: getInstance(),castBloc: getInstance(),videosBloc: getInstance(),favouriteBloc: getInstance()));
  getInstance.registerFactory(() => CastBloc(getCast: getInstance()));
  getInstance.registerFactory(() => VideosBloc(getVideos: getInstance()));
  getInstance.registerFactory(() => SearchMovieBloc(getSearchMovies: getInstance()));

  getInstance.registerSingleton<LanguageBloc>(LanguageBloc());
  getInstance.registerSingleton<FavouriteBloc>(FavouriteBloc(saveMovie: getInstance(),getFavouriteMovies: getInstance(),deleleFavouriteMovie: getInstance(),checkIfFavouriteMovie: getInstance()));

}
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app_bloc/data/core/api_client.dart';
import 'package:movie_app_bloc/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_bloc/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_bloc/domain/respositories/movie_repository.dart';
import 'package:movie_app_bloc/domain/usecases/get_playing_now.dart';
import 'package:movie_app_bloc/domain/usecases/get_popular.dart';
import 'package:movie_app_bloc/domain/usecases/get_trending.dart';
import 'package:movie_app_bloc/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getInstance = GetIt.instance;

Future init() async {
  getInstance.registerLazySingleton<Dio>(() => Dio());

  getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));

  getInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getInstance()));

  getInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getInstance()));

  getInstance.registerLazySingleton<GetTrending>(() => GetTrending(getInstance()));
  
  getInstance.registerFactory(() => MovieCarouselBloc(getTrending: getInstance(),movieBackDropBloc: getInstance()));
  
  getInstance.registerFactory(() => MovieBackdropBloc());

  getInstance.registerFactory(() => MovieTabbedBloc(
      getTrending: GetTrending(getInstance()),
      getPopular: GetPopular(getInstance()),
      getPlayingNow: GetPlayingNow(getInstance())));

  getInstance.registerSingleton<LanguageBloc>(LanguageBloc());

}
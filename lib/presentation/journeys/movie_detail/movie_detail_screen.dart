import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/data/core/app_color.dart';
import 'package:movie_app_bloc/di/get_it.dart';
import 'package:movie_app_bloc/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie_app_bloc/presentation/journeys/movie_detail/videos_widget.dart';

import 'cast_widget.dart';
import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({Key? key, required this.movieDetailArguments})
      : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  late MovieDetailBloc _movieDetailBloc;
  late CastBloc _castBloc;
  late VideosBloc _videosBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _movieDetailBloc.add(
        MovieDetailLoadEvent(widget.movieDetailArguments.movieId));

  }

  @override
  void dispose() {
    super.dispose();
    _movieDetailBloc.close();
    _castBloc.close();
    _videosBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _movieDetailBloc),
            BlocProvider.value(value: _castBloc),
            BlocProvider.value(value: _videosBloc),
          ],
          child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
            builder: (context, state) {
              if(state is MovieDetailLoaded){
                final movieDetail = state.movieDetailEntity;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BigPoster(movie:movieDetail),

                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        child: Text(movieDetail.overview!),
                      ),

                      Padding(padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Cast",style: TextStyle(fontSize: 20),),),

                      CastWidget(),

                      VideosWidget(videosBloc:_videosBloc)
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

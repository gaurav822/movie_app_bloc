import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/di/get_it.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

import '../../blocs/movie_carousel/movie_carousel_state.dart';
import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieCarouselBloc movieCarouselBloc;
  late MovieBackdropBloc movieBackdropBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackDropBloc;
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => movieCarouselBloc),
          BlocProvider(create: (context) => movieBackdropBloc)
        ],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
            builder: (context, state) {
              if(state is MovieCarouselLoaded){
                print("The movies are");
                print(state.movies);
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex:state.defaultIndex
                      ),
                    ),
                    const FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: Placeholder(color: Colors.red,),
                    )
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

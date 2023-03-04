import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/di/get_it.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';
import 'package:movie_app_bloc/presentation/journeys/drawer/navigation_drawer.dart';

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
  late MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackDropBloc;
    movieTabbedBloc = getInstance<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc.close();
    movieBackdropBloc.close();
    movieCarouselBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => movieCarouselBloc),
          BlocProvider(create: (context) => movieBackdropBloc),
          BlocProvider(create: (context) => movieTabbedBloc)
        ],
        child: Scaffold(
          drawer: const CustomNavigationDrawer(),
          backgroundColor: Colors.black,
          body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
            builder: (context, state) {
              if(state is MovieCarouselLoaded){
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
                      child: MovieTabbedWidget(),
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

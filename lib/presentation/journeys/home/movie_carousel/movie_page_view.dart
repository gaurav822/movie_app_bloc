import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

import '../../../../domain/entities/movie_entity.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({Key? key, required this.movies, required this.initialPage}) : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {

  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =  PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7
    );
  }

  @override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height*.35,
      child: PageView.builder(
        controller: _pageController,
          itemBuilder: (context,index){
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
              pageController: _pageController,
              posterPath: movie.posterPath??"", movieId: movie.id??0);
        },
        pageSnapping: true,
        itemCount: widget.movies?.length??0,
        onPageChanged: (index){
          BlocProvider.of<MovieBackdropBloc>(context).add(MovieBackDropChangeEvent(widget.movies[index]));
        },
      ),
    );
  }
}

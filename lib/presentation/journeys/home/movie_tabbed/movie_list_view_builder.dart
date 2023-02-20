import 'package:flutter/cupertino.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_carousel/movie_card_widget.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

import '../../../../domain/entities/movie_entity.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;
  const MovieListViewBuilder({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
        itemBuilder: (context,index){
        final MovieEntity movie = movies[index];
        return MovieTabCardWidget(posterPath: movie.posterPath!, movieId: movie.id!, title: movie.title!,);
        },
        separatorBuilder: (context,index){
        return const SizedBox(width: 14,);
        },
        itemCount: movies.length);
  }
}

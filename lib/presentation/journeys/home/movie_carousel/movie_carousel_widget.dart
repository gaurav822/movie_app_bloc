import 'package:flutter/cupertino.dart';
import 'package:movie_app_bloc/presentation/widget/movie_app_bar.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;
  const MovieCarouselWidget({Key? key, required this.movies,required this.defaultIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackDropWidget(),
        Column(
          children: [
            MovieAppbar(),
            SizedBox(height: 40,),
            MoviePageView(
              movies:movies,
              initialPage:defaultIndex
            )
          ],
        ),
      ],
    );
  }
}

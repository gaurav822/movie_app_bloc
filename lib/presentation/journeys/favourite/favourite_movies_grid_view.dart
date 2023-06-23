import 'package:flutter/cupertino.dart';

import '../../../domain/entities/movie_entity.dart';
import 'favourite_movie_card_widget.dart';

class FavouriteMovieGridView extends StatelessWidget {

  final List<MovieEntity> movies;
  const FavouriteMovieGridView({Key? key,required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: movies.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.7,crossAxisSpacing: 16,),
          itemBuilder: (context,index){
            return FavouriteMovieCardWidget(
              movie:movies[index]
            );
          }),
    );
  }
}

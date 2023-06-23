import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/di/get_it.dart';
import 'package:movie_app_bloc/presentation/blocs/favourite/favourite_bloc.dart';

import 'favourite_movies_grid_view.dart';

class FavouriteScreen extends StatefulWidget{
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> with WidgetsBindingObserver {

  late FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    _favouriteBloc = getInstance<FavouriteBloc>();
    _favouriteBloc.add(LoadFavouriteMovieEvent());
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favourite Movies"),),
      body:
      BlocProvider.value(
          value: _favouriteBloc,
        child: BlocBuilder<FavouriteBloc,FavouriteState>(
          builder: (context,state){
            if(state is FavouriteMoviesLoaded){
              if(state.movies.isEmpty){
                return Center(child: Text("No Favourite Movies"),);
              }

              return FavouriteMovieGridView(movies: state.movies,);
            }

            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

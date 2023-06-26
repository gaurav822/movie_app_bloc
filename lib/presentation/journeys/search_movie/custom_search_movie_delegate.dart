import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/search_movie/search_movie_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/search_movie/search_movie_card.dart';
import 'package:movie_app_bloc/presentation/themes/theme_text.dart';
import 'package:movie_app_bloc/translations/locale_keys.g.dart';

import '../../../data/core/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
class CustomSearchMovieDelegate extends SearchDelegate{
  final SearchMovieBloc searchMovieBloc;
  CustomSearchMovieDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 20,color: Colors.grey)
      )
    );
  }


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
          query='';
      }, icon: Icon(Icons.clear,color: query.isNotEmpty?Colors.grey:AppColor.vulcan,))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return GestureDetector(
     onTap: (){
       close(context, null);
     },
       child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,));
  }

  @override
  Widget buildResults(BuildContext context) {
   return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchMovieBloc.add(
        SearchTermChangedEvent(query)
    );
    return BlocBuilder<SearchMovieBloc,SearchMovieState>(
        bloc: searchMovieBloc,
        builder: (context,state){
          if(state is SearchMovieError){
            return const SizedBox();
          }
          else if(state is SearchMovieLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(state is SearchMovieLoaded){
            final movies = state.movies;
            if(movies.isEmpty){
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Text(LocaleKeys.no_movies_found.tr()),
                ),
              );
            }
            else{
              return ListView.builder(
                itemBuilder: (context,index)=> SearchMovieCard(movie: movies[index]),
                itemCount: movies.length,
                scrollDirection: Axis.vertical,
              );
            }
          }
          else {
            return const SizedBox.shrink();
          }

        });
  }

}
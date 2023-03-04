import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/movie_tabbed_constants.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc => BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex=0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc,MovieTabbedState>(
        builder: (context,state){
          print(state.currentTabIndex);
          return Padding(
              padding: EdgeInsets.only(top: 4),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for(var i=0;i<MovieTabbedConstants.movieTabs.length;i++)
                      TabTitleWidget(
                          title: MovieTabbedConstants.movieTabs[i].title,
                          onTap: ()=> _onTabTapped(i),
                          isSelected: MovieTabbedConstants.movieTabs[i].index==state.currentTabIndex)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if(state is MovieTabbedChanged)
                  Expanded(child: MovieListViewBuilder(movies: state.movies,))
              ],
            ),
          );
        }
    );
  }

  void _onTabTapped(int index){
    print("curr index $index");
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}

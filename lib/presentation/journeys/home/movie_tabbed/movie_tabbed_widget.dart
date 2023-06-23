import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_bloc/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/movie_list_view_builder.dart';
import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/tab_title_widget.dart';

import '../../../../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
                    TabTitleWidget(title: LocaleKeys.popular.tr(), onTap: ()=> _onTabTapped(0), isSelected: state.currentTabIndex==0),
                    TabTitleWidget(title:LocaleKeys.now.tr(), onTap: ()=> _onTabTapped(1), isSelected: state.currentTabIndex==1),
                    TabTitleWidget(title: LocaleKeys.trending.tr(), onTap: ()=> _onTabTapped(2), isSelected: state.currentTabIndex==2)
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

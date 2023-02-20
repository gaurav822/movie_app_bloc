import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabbedConstants{
  static const List<Tab> movieTabs = [
    Tab(index: 0, title: 'Popular'),
    Tab(index: 1, title: 'Now'),
    Tab(index: 2, title: 'Trending'),
  ];
}
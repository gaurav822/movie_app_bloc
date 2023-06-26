import 'package:movie_app_bloc/presentation/journeys/home/movie_tabbed/tab.dart';
import 'package:movie_app_bloc/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';


class MovieTabbedConstants{
  static List<Tab> movieTabs = [
    Tab(index: 0, title: 'popular'),
    Tab(index: 1, title:  'now'),
    Tab(index: 2, title:  'trending'),
  ];
}
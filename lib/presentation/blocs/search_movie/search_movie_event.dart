part of 'search_movie_bloc.dart';

@immutable
abstract class SearchMovieEvent {}

class SearchTermChangedEvent extends SearchMovieEvent {
  final String searchTerm;
  SearchTermChangedEvent(this.searchTerm);
}


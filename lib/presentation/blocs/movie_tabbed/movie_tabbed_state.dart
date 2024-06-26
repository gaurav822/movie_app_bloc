part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int currentTabIndex;
  const MovieTabbedState({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];

}

class MovieTabbedInitial extends MovieTabbedState {
  const MovieTabbedInitial({required super.currentTabIndex});

}

class MovieTabbedChanged extends MovieTabbedState {
  final List<MovieEntity> movies;
  const MovieTabbedChanged({required int currentTabIndex,required this.movies})
  : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex,movies];
}

class MovieTabLoadError extends MovieTabbedState{
  const MovieTabLoadError({required int currentTabIndex}):super(currentTabIndex: currentTabIndex);

}

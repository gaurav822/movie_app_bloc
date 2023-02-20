part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();
}

class MovieTabChangedEvent extends MovieTabbedEvent{
  final int currentTabIndex;
  const MovieTabChangedEvent({this.currentTabIndex=0});

  @override
  // TODO: implement props
  List<Object?> get props => [currentTabIndex];
}

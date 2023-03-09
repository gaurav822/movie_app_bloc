part of 'cast_bloc.dart';

@immutable
abstract class CastEvent {
  const CastEvent();
}

class LoadCastEvent extends CastEvent {
  int movieId;
  LoadCastEvent({required this.movieId});
}

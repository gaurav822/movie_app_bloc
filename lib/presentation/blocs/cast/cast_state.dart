part of 'cast_bloc.dart';

@immutable
abstract class CastState {}

class CastInitial extends CastState {}

class CastLoaded extends CastState {
  final List<CastEntity> casts;

  CastLoaded({required this.casts});
}

class CastError extends CastState {}

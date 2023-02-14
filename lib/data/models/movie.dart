import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_bloc/domain/entities/movie_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'movie.g.dart';

@immutable
@JsonSerializable()
class Movie extends MovieEntity{

  const Movie({
    super.adult,
    super.title,
    super.overview,
    super.voteAverage,
    super.releaseDate,
    super.posterPath,
    @JsonKey(name: "backdrop_path") super.backdropPath,
    super.id,
    super.genreIds,
    super.mediaType,
    super.originalLanguage,
    super.originalTitle,
    super.popularity,
    super.video,
    super.voteCount
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
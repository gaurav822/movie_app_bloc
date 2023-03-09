import 'package:freezed_annotation/freezed_annotation.dart';

class MovieDetailEntity {
  final int? id;
  final String? title;
  final String? overview;
  @JsonKey(name:"release_date")
  final String? releaseDate;
  @JsonKey(name: "vote_average")
  final double? voteAverage;
  @JsonKey(name:"backdrop_path")
  final String? backDropPath;
  @JsonKey(name: "poster_path")
  final String? posterPath;

  const MovieDetailEntity({this.id,this.title,this.overview,this.releaseDate,this.voteAverage,this.backDropPath,this.posterPath});

}
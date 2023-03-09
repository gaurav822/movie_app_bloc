import 'package:movie_app_bloc/data/models/movie_detail_result_model.dart';
import 'package:movie_app_bloc/domain/entities/movie_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'movie_detail_model.g.dart';

@immutable
@JsonSerializable()
class MovieDetailModel extends MovieDetailEntity{

  const MovieDetailModel(
      {
        super.id,
        super.title,
        super.overview,
        super.releaseDate,
        super.voteAverage,
        super.backDropPath,
        super.posterPath});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}
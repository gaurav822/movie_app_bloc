import 'package:movie_app_bloc/domain/entities/cast_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

part 'cast_model.g.dart';

@immutable
@JsonSerializable()
class CastModel extends CastEntity {
  const CastModel({
    super.id,
    super.name,
    super.gender,
    super.castId,
    super.popularity,
    super.adult,
    super.character,
    super.creditId,
    super.knownForDepartment,
    super.order,
    super.originalName,
    super.profilePath
});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return _$CastModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
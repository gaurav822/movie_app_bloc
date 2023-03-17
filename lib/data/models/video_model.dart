import 'package:movie_app_bloc/domain/entities/cast_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../domain/entities/video_entity.dart';

part 'video_model.g.dart';

@immutable
@JsonSerializable()
class VideoModel extends VideoEntity{

 const VideoModel(
      {super.iso6391,
        super.iso31661,
        super.name,
        super.key,
        super.site,
        super.size,
        super.type,
        super.official,
        super.publishedAt,
        super.id});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return _$VideoModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
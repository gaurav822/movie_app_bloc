// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastModel _$CastModelFromJson(Map<String, dynamic> json) => CastModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      gender: json['gender'] as int?,
      castId: json['cast_id'] as int?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      adult: json['adult'] as bool?,
      character: json['character'] as String?,
      creditId: json['credit_id'] as String?,
      knownForDepartment: json['known_for_department'] as String?,
      order: json['order'] as int?,
      originalName: json['original_name'] as String?,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
